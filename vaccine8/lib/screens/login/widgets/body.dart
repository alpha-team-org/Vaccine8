import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/models/user.dart';

// import '../../../models/user.dart';
import '../../view.dart';
import '../login_viewmodel.dart';

class Body extends StatelessWidget {
  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();

    if (_user != null) {
      (_user.isDr)
          ? Navigator.pushReplacementNamed(context, jdjkdashboardRout)
          : Navigator.pushReplacementNamed(context, dashboardRoute);
    }
    if (_user == null) print('user null');
  }

  void _onCancel(BuildContext context, LoginViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return View<LoginViewmodel>(
      builder: (context, viewmodel, _) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/app_logo.png'),
              SizedBox(height: 20),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Color.fromRGBO(24, 20, 97, 0.8),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  color: Color.fromRGBO(28, 28, 28, 1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              SizedBox(height: 60),
              _buildTextField(
                  hint: 'Username',
                  icon: Icons.people,
                  onChanged: (value) => viewmodel.username = value),
              _buildTextField(
                  hint: 'Password',
                  isObsecure: !viewmodel.showPassword,
                  icon: Icons.lock,
                  button: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () =>
                          viewmodel.showPassword = !viewmodel.showPassword),
                  onChanged: (value) => viewmodel.password = value),
              if (viewmodel.showErrorMessage)
                Text(
                  'Invalid username or password!',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              SizedBox(height: 10.0),
              _buildButtons(context, viewmodel),
              // ElevatedButton(
              //   onPressed: () => {},
              //   style: ButtonStyle(
              // minimumSize: MaterialStateProperty.all(Size(200, 60)),
              //     backgroundColor:
              //         MaterialStateProperty.all(Color.fromRGBO(42, 42, 192, 1)),
              //   ),
              //   child: Text(
              //     'Sign in with Username and Password',
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              SizedBox(height: 30),
              Text(
                'OR',
                style: TextStyle(
                  color: Color.fromRGBO(28, 28, 28, 1),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              SizedBox(height: 20),
              SignInButtonBuilder(
                elevation: 2.0,
                key: ValueKey("Facebook"),
                text: 'Sign in with Facebook',
                fontSize: 20,
                icon: FontAwesomeIcons.facebookF,
                image: ClipRRect(
                  child: Image(
                    image: AssetImage(
                      'assets/logos/facebook_new.png',
                      package: 'flutter_signin_button',
                    ),
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
                backgroundColor: Color(0xFF3B5998),
                innerPadding: EdgeInsets.fromLTRB(12, 0, 11, 0),
                onPressed: () async {
                  final User _user = await viewmodel.facebookLogin();
                  if (_user != null) {
                    Navigator.pushReplacementNamed(context, dashboardRoute);
                  } else
                    print('user null');
                },
                width: 360,
                height: 60,
              ),
              // SizedBox(height: 20),
              // Text(
              //   'OR',
              //   style: TextStyle(
              //     color: Color.fromRGBO(28, 28, 28, 1),
              //     fontSize: 15.0,
              //     fontWeight: FontWeight.bold,
              //     fontFamily: 'RobotoMono',
              //   ),
              // ),
              SizedBox(height: 20),
              SignInButtonBuilder(
                elevation: 2,
                key: ValueKey("Google"),
                text: 'Sign in with Google',
                fontSize: 20,
                textColor: Color.fromRGBO(0, 0, 0, 0.54),
                image: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 3.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: AssetImage(
                        'assets/logos/google_light.png',
                        package: 'flutter_signin_button',
                      ),
                      // height: 50.0,
                      // width: 50.0,
                    ),
                  ),
                ),
                backgroundColor: Color(0xFFFFFFFF),
                onPressed: () async {
                  final User _user = await viewmodel.loginGoogle();
                  if (_user != null) {
                    Navigator.pushReplacementNamed(context, dashboardRoute);
                  } else
                    print('user null');
                },
                width: 360,
                height: 60,
              )
              // SignInButton(
              //   Buttons.Google,
              //   onPressed: () async {
              //     final User _user = await viewmodel.loginGoogle();
              //     if (_user != null) {
              //       Navigator.pushReplacementNamed(context, dashboardRoute);
              //     } else
              //       print('user null');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context, LoginViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Log in'),
          onPressed: () => {_onLogin(context, viewmodel)},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(42, 42, 192, 1)),
          ),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => _onCancel(context, viewmodel),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(42, 42, 192, 1)),
          ),
        ),
      ],
    );
  }
}
