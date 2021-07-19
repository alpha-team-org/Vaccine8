import 'package:shared_preferences/shared_preferences.dart';

import '../models/session.dart';

class SessionService {
  final _session = Session();

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // If the token has not set yet, then load the cached one
    if (_session.token == null) {
      _session.token = prefs.getString('token');
      // if cached token exists
      // load cached token from SharedPreference / Flutter session
    }
    return _session.token;
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token == null) {
      prefs.remove('token');
      // if cached token exists
      // Delete the file
    } else {
      prefs.setString('token', token);
      // write the token to sharedpreference
    }

    _session.token = token;
  }

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // If the token has not set yet, then load the cached one
    if (_session.userID == null) {
      _session.userID = prefs.getString('userID');
      // if cached token exists
      // load cached token from SharedPreference / Flutter session
    }
    return _session.userID;
  }

  Future<void> setUser(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userID == null) {
      prefs.remove('userID');
      // if cached token exists
      // Delete the file
    } else {
      prefs.setString('userID', userID);
      // write the token to sharedpreference
    }

    _session.userID = userID;
  }
}
