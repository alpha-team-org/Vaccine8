import 'package:vaccine8/models/user.dart';

abstract class AuthService {
  Future<User> authenticate({String login, String password});
  Future<void> signout();
  Future<void> loginGoogle();
  Future<User> login(String username, String passwrod);
}
