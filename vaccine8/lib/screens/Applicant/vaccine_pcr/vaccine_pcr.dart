import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine_pcr_body.dart';

class VaccineAndPcrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(Colors.white),
      body: Body("Vaccine ", "PCR"),
    );
  }
}
