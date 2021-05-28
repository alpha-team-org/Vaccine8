import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/pcr_centers/pcr_centers_body.dart';

class CentersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Bar(Colors.white), body: Body(centerList));
  }
}
