import 'package:shared_preferences/shared_preferences.dart';
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

  get userID async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userID');
  }

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

  Future<User> getUser(String userID) async {
    turnBusy();
    user = await _service.getUser(userID);
    turnIdle();
    return user;
  }

  Future<User> loginGoogle() async {
    turnBusy();
    user = await _service.loginGoogle();
    if (user == null) _showErrorMessage = true;
    turnIdle();
    return user;
  }

  Future<User> facebookLogin() async {
    turnBusy();
    user = await _service.facebookLogin();
    if (user == null) _showErrorMessage = true;
    turnIdle();
    return user;
  }

  Future<User> authenticate() async {
    turnBusy();
    user = await _service.authenticate(login: username, password: password);
    if (user == null) _showErrorMessage = true;
    turnIdle();
    return user;
  }

  Future<void> signout() async {
    turnBusy();
    await _service.signout();
    turnIdle();
  }
}
