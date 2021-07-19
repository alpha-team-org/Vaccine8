import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vaccine8/models/user.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceSecuredRest implements AuthService {
  RestService get rest => dependency();

  final _auth = fb.FirebaseAuth.instance;
  final googleSignin = GoogleSignIn(scopes: ['email']);
  Future<fb.UserCredential> signInWithCredential(
          fb.AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Stream<fb.User> get currentUser => _auth.authStateChanges();

  final facebook = FacebookLogin();

  Future<User> facebookLogin() async {
    try {
      print('Starting Facebook Login');

      final res = await facebook.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email
      ]);

      switch (res.status) {
        case FacebookLoginStatus.success:
          print('It worked');

          //Get Token
          final FacebookAccessToken fbToken = res.accessToken;

          //Convert to Auth Credential
          final fb.AuthCredential credential =
              fb.FacebookAuthProvider.credential(fbToken.token);

          //User Credential to Sign in with Firebase
          final result = await signInWithCredential(credential);
          if (result.additionalUserInfo.isNewUser) {
            await rest.post(
              "users",
              data: {
                "id": result.user.uid,
                "email": result.user.email,
                "name": result.user.displayName,
                "address": "",
                "isDr": false,
                "photoUrl": result.user.photoURL
              },
            );
          }

          final _user = await rest.get("users/${result.user.uid}");

          if (_user != null && _user.length != 0) {
            rest.openSession(result.user.uid, result.user.uid);
            return User.fromJson(_user);
          }
          break;
        case FacebookLoginStatus.cancel:
          print('The user canceled the login');
          break;
        case FacebookLoginStatus.error:
          print('There was an error');
          break;
      }
      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User> loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final fb.AuthCredential credential = fb.GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      //Firebase Sign in
      final result = await signInWithCredential(credential);

      if (result.additionalUserInfo.isNewUser) {
        await rest.post(
          "users",
          data: {
            "id": result.user.uid,
            "email": result.user.email,
            "name": result.user.displayName,
            "address": "",
            "isDr": false,
            "photoUrl": result.user.photoURL
          },
        );
      }

      final _user = await rest.get("users/${result.user.uid}");

      if (_user != null && _user.length != 0) {
        rest.openSession(result.user.uid, result.user.uid);
        return User.fromJson(_user);
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User> authenticate({String login, String password}) async {
    try {
      final json = await rest
          .post('auths/signin', data: {'email': login, 'password': password});

      if (json == null) return null;

      // Pre-process json data to comply with the field of the Patient model
      final _user = await rest.get("users/${json['localId']}");

      if (_user != null && _user.length != 0) {
        rest.openSession(json['idToken'], json['localId']);
        return User.fromJson(_user);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
    await rest.closeSession();
  }

  Future<User> getUser(String userID) async {
    final _user = await rest.get("users/$userID");
    return User.fromJson(_user);
  }
}
