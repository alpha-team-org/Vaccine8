import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'app/dependencies.dart' as di;

import './app/router.dart' as router;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      //onGenerateRoute:RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: introScreenRoute,
      onGenerateRoute: router.createRoute,
    );
  }
}
