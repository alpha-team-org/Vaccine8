import 'package:vaccine8/models/Patient.dart';

abstract class AuthService {
  Future<User> authenticate({String login, String password});
  Future<void> signout();
  Future<User>login(String username , String passwrod);
}
