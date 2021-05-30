import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pick_appontment/pick_appointment_body.dart';

class PickAppointmentScreen extends StatelessWidget {
  Patient patient;
  Centers centers;
  PickAppointmentScreen(this.centers, this.patient);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Body(centers, patient),
      bottomNavigationBar: BottomBar(),
    );
  }
}
