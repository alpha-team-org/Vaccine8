import 'package:flutter/material.dart';
import 'package:vaccine8/components/bar.dart';
import 'package:vaccine8/screens/Applicant/Dashboard/body.dart';
import 'Drawer.dart';

class AppllicantDasboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
      drawer: Draw(),
    );
  }
}
