import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_centers_body.dart';
import 'package:vaccine8/screens/view.dart';
// import 'package:vaccine8/view.dart';


import 'pcr_viewmodel.dart';

class CentersScreen extends StatelessWidget {
  Patient patient;
  CentersScreen({@required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: View(
        viewmodel: PcrViewModel(),

              builder:

              (__,viewmodel,___){
                final centerlist = viewmodel.getHospital();
                
                 Body(
          centerlist,
          patient: patient,
        );}
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
