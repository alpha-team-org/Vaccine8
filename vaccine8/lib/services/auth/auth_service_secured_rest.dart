import 'package:vaccine8/models/Patient.dart';

import '../../app/dependencies.dart';
import '../../models/Patient.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceSecuredRest implements AuthService {
  RestService get rest => dependency();

  Future<Patient> authenticate({String login, String password}) async {
    try {
      final json = await rest
          .post('auths/signin', data: {'email': login, 'password': password});

      if (json == null) return null;

      // Pre-process json data to comply with the field of the Patient model
      json['id'] = json['localId'];
      json['name'] = json['displayName'];
      json['photoUrl'] = json['profilePicture'];

      // Get the access token and let the rest object stores that
      rest.openSession(json['idToken']);

      final _patient = Patient.fromJson(json);
      return _patient;
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async => rest.closeSession();
}
