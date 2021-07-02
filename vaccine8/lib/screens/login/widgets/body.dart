import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/models/Patient.dart';

// import '../../../models/user.dart';
import '../../view.dart';
import '../login_viewmodel.dart';

class Body extends StatelessWidget {
  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final Patient _user = await viewmodel.authenticate();

    if (_user != null) {
      Navigator.pushNamed(context, dashboardRoute);
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
                  onChanged: (value) => 
                  viewmodel.username = value),
              _buildTextField(
                  hint: 'Password',
                  isObsecure: !viewmodel.showPassword,
                  icon: Icons.lock,
                  button: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () =>
                          viewmodel.showPassword = !viewmodel.showPassword),
                  onChanged: (value) =>
                   viewmodel.password = value),
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
              //     minimumSize: MaterialStateProperty.all(Size(200, 60)),
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
              ElevatedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(360, 60)),
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromRGBO(58, 85, 159, 1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.facebookF),
                    SizedBox(width: 20),
                    Text(
                      'Sign in with Facebook',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
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
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
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
