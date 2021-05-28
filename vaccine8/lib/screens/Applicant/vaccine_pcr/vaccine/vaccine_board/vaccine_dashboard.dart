import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_body.dart';

class VaccineBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(Colors.white),
      body: Body("Book appointment", "PCR result"),
    );
  }
}
