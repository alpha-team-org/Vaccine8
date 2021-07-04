import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/services/rest.dart';
import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Patient _patient;
  bool _showPassword = false;
  bool _showErrorMessage = false;
  String name;
  String _password;
  get user => _patient;
  set user(value) => _patient = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    _showPassword = value;
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    _showErrorMessage = value;
  }

  get username => name;
  set username(value) {
    _showErrorMessage = false;
    name = value;
  }

  get password => _password;
  set password(value) {
    _showErrorMessage = false;
    _password = value;
  }

  Future<Patient> login() async {
    turnBusy();
    final p = await _service.login(username, password);
    _patient = p;
    turnIdle();
    return p;
  }

  Future<Patient> authenticate() async {
    turnBusy();
    final Patient _patient =
        await _service.authenticate(login: username, password: password);
    if (_patient == null) _showErrorMessage = true;
    turnIdle();
    return _patient;
  }
}
