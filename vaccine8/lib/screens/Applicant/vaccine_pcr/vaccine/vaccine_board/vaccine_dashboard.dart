import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/components/widgets/bottom_navigation_bar.dart';
import 'package:vaccine8/models/user.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_body.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_viewmodel.dart';

import '../../../../view.dart';

class VaccineBoardScreen extends StatelessWidget {
  final User patient;
  VaccineBoardScreen({@required this.patient});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Bar(Colors.white),
      backgroundColor: Color(0xFFF5F5F7),
      body: ConsumerView<VaccineDashboardViewmodel>(
        initViewmodel: (viewmodel) =>
            dependency<VaccineDashboardViewmodel>().appointmentList(),
        builder: (context, viewmodel, __) => Body(
          viewmodel: viewmodel,
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
