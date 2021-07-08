import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_body.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_viewnodel.dart';

import '../../../../view.dart';

class PcrBoardScreen extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Bar(Colors.white),
      backgroundColor: Color(0xFFF5F5F7),
      body: ConsumerView<PcrDashboardViewmodel>(
        initViewmodel: (viewmodel) =>
            dependency<PcrDashboardViewmodel>().appointmentList(),
        builder: (context, viewmodel, __) => Body(
          viewmodel: viewmodel,
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
