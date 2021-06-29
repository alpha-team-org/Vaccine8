import 'package:vaccine8/models/Patient.dart';

abstract class AuthService {
  Future<Patient> authenticate({String login, String password});
  Future<void> signout();
}
