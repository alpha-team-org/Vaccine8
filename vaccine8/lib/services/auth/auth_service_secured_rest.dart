import 'package:vaccine8/models/user.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceSecuredRest implements AuthService {
  RestService get rest => dependency();

  Future<User> authenticate({String login, String password}) async {
    try {
      final json = await rest
          .post('auths/signin', data: {'email': login, 'password': password});

      if (json == null) return null;

      // Pre-process json data to comply with the field of the Patient model
      final _user = await rest.get("users/${json['localId']}");

      if (_user != null && _user.length != 0) {
        // Get the access token and let the rest object stores that
        // rest.openSession(json['idToken']);
        return User.fromJson(_user);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async => rest.closeSession();

  Future<User> login(String email, String passwrod) async {
    final json = await rest.get('Applicant?email=$email&password=$passwrod');
    if (json.length == 0) return null;
    final p = User.fromJson(json[0]);
    return p;
  }
}
