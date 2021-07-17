import 'package:vaccine8/models/user.dart';
import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User _user;
  bool _showPassword = false;
  bool _showErrorMessage = false;
  String name;
  String _password;
  get user => _user;
  set user(value) => _user = value;

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

  Future<User> login() async {
    turnBusy();
    final p = await _service.login(username, password);
    _user = p;
    turnIdle();
    return p;
  }

  Future<void> loginGoogle() async {
    turnBusy();
    await _service.loginGoogle();
    turnIdle();
  }

  Future<User> authenticate() async {
    turnBusy();
    user = await _service.authenticate(login: username, password: password);
    if (user == null) _showErrorMessage = true;
    turnIdle();
    return user;
  }
}
