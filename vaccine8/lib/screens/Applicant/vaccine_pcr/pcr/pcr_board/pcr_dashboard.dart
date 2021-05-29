import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_body.dart';

class PcrBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Bar(Colors.white),
      backgroundColor: Color(0xFFF5F5F7),
      body: Body("Book appointment", "PCR result"),
      bottomNavigationBar: BottomBar(),
    );
  }
}
