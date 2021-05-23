import 'package:flutter/material.dart';


import './app/router.dart' as router;

void main() {
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
      initialRoute: "/dash_board",
      onGenerateRoute: router.createRoute,
// home :AppllicantDasboardScreen()
    );
  }
}
