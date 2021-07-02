import 'package:flutter/material.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_centers_body.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_viewmodel.dart';
import 'package:vaccine8/screens/view.dart';



class VaccineCentersScreen extends StatelessWidget {
  Patient patient;
  VaccineCentersScreen({@required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F7),
        body: View<VaccineViewModel>(
            initViewmodel: (viewmodel) =>
                dependency<VaccineViewModel>().getHospital(),
            builder: (context, viewmodel, ___) {
              final centerList = viewmodel.centers;

              return Body(
                centerList,
                patient: patient,
              );
            },
            ),
            bottomNavigationBar: BottomBar());
  }
}
