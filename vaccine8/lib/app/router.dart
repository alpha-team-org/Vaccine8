import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'dependcies.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardRoute:
      return MaterialPageRoute(
          builder: (context) => AppllicantDasboardScreen());
    case pcrAndVaccineRoute:
      return MaterialPageRoute(builder: (context) => VaccineAndPcrScreen());
    case pcrRoute:
      return MaterialPageRoute(builder: (context) => PcrBoardScreen());
    case pcrAppointmentRoute:
      return MaterialPageRoute(
          builder: (context) => PickAppointmentScreen(settings.arguments));
    case successfullRoute:
      return MaterialPageRoute(builder: (context) => SuccessfullPickedScreen());
    case centersRoute:
      return MaterialPageRoute(builder: (context) => CentersScreen());
  }
}
