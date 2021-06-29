import 'package:vaccine8/models/Patient.dart';
import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Patient _patient = Patient();
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get user => _patient;
  set user(value) => _patient = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  get username => _patient.name;
  set username(value) {
    turnBusy();
    _showErrorMessage = false;
    _patient.name = value;
    turnIdle();
  }

  get password => _patient.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _patient.password = value;
    turnIdle();
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
