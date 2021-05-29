import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'dependcies.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/dash_board':
      return MaterialPageRoute(
          builder: (context) => AppllicantDasboardScreen());
    case '/&pcrvac':
      return MaterialPageRoute(builder: (context) => VaccineAndPcrScreen());
    case '/vacboard':
      return MaterialPageRoute(builder: (context) => VaccineBoardScreen());
    case '/vacapp':
      return MaterialPageRoute(
          builder: (context) => PickAppointmentScreen(settings.arguments));
    case '/succPicked':
      return MaterialPageRoute(builder: (context) => SuccessfullPickedScreen());
    case '/centers':
      return MaterialPageRoute(builder: (context) => CentersScreen());
    case '/ApplicantAppointment':
      return MaterialPageRoute(
          builder: (context) => ApplicantAppointmentScreen());
  }
}
