import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_centers_body.dart';

class CentersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Body(centerList),
      bottomNavigationBar: BottomBar(),
    );
  }
}
