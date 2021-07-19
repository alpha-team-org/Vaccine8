import 'package:vaccine8/models/user.dart';

abstract class AuthService {
  Future<User> authenticate({String login, String password});
  Future<void> signout();
  Future<User> loginGoogle();
  Future<User> facebookLogin();
  Future<User> getUser(String userID);
}
