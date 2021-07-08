import 'package:flutter/material.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_centers_body.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';
import 'package:vaccine8/screens/view.dart';
// import 'package:vaccine8/view.dart';


import 'pcr_viewmodel.dart';

class CentersScreen extends StatelessWidget {
  User patient;
  CentersScreen({@required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: View<PcrViewModel>(
        initViewmodel:(viewmodel)=>dependency<PcrViewModel>().getHospital(),

              builder:

              (context,viewmodel,___){
              viewmodel.userId =  dependency<LoginViewmodel>().user.id;
                
                final centerlist = viewmodel.centers;
                
               return    Body(
          centerlist,
           viewmodel,
        );}
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
