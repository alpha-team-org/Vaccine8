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
  String name ;
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

  get password =>_password;
  set password(value) {
  
    _showErrorMessage = false;
    _password = value;
    
  }


Future<Patient> login() async{
  turnBusy();
final p  =await _service.login(username, password);
// print(user.id);
_patient = p;
  turnIdle();
return p;
}


  // get rest => dependency<RestService>();

  // RestService rest = RestService(
  //     // baseUrl: 'http://192.168.0.5:3000',  // with Local JSON-server
  //     baseUrl:
  //         'http://192.168.100.40:5001/vaccine8-dcf02/us-central1/api', // Firebase emulator
  //     // 'http://localhost:5001/vaccine8-dcf02/us-central1/api', // Firebase emulator
  //     // baseUrl: 'https://us-central1-mvvm-frontend-and-mvc-backend.cloudfunctions.net/api',
  //     enableSession: true // Firebase REST live
  //     );

  // Future<Patient> authenticate({String login, String password}) async {
  //   try {
  //     final json = await rest
  //         .post('auths/signin', data: {'email': login, 'password': password});

  //     if (json == null) {
  //       print('json null');
  //       return null;
  //     }

  //     print(json);
  //     print("json");
  //     // Pre-process json data to comply with the field of the Patient model
  //     json['id'] = json['localId'];
  //     json['name'] = json['displayName'];
  //     json['photoUrl'] = json['profilePicture'];

  //     // Get the access token and let the rest object stores that
  //     rest.openSession(json['idToken']);

  //     final _patient = Patient.fromJson(json);
  //     return _patient;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future<Patient> authenticateLogin() async {
  //   turnBusy();
  //   final json = await rest
  //       .post('auths/signin', data: {'email': username, 'password': password});

  //   if (json == null) {
  //     print('json null');
  //     return null;
  //   }

  //   print(json);
  //   print("json");
  //   // Pre-process json data to comply with the field of the Patient model
  //   json['id'] = json['localId'];
  //   json['name'] = json['displayName'];
  //   json['photoUrl'] = json['profilePicture'];

  //   // Get the access token and let the rest object stores that
  //   // rest.openSession(json['idToken']);

  //   final _patient1 = Patient.fromJson(json);
  //   // return _patient;
  //   // final Patient _patient =
  //   //     await authenticate(login: username, password: password);
  //   print(username);
  //   print(password);
  //   if (_patient == null) _showErrorMessage = true;
  //   turnIdle();
  //   return _patient1;
  // }
}
