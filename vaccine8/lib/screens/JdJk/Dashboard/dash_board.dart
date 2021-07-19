import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/screens/JdJk/Dashboard/widget/Drawer.dart';
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
      body: Body(),
      drawer: SideDrawer(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
