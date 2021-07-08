import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';

import 'package:vaccine8/models/user.dart';

import './widget/Drawer.dart';

import 'widget/body.dart';

class JDJKDasboardScreen extends StatelessWidget {
  // final Patient patient;
  JDJKDasboardScreen(
      // {@required this.patient}
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Body(
          // patient: patient
          ),
      drawer: Draw(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
