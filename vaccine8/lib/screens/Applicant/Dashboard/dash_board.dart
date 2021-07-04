import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/Applicant/Dashboard/body.dart';
import 'Drawer.dart';

class AppllicantDasboardScreen extends StatelessWidget {
  // final Patient patient;
  // AppllicantDasboardScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Body(),
      drawer: Draw(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
