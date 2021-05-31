import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/pick_appontment/pick_ppointment.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/successful_picked/successful_picked.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dashboard.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_centers.dart';
import 'dependcies.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardRoute:
      return MaterialPageRoute(
          builder: (context) =>
              AppllicantDasboardScreen(patient: patientList[0]));

// PCR Section
    case pcrRoute:
      return MaterialPageRoute(
          builder: (context) => PcrBoardScreen(patient: settings.arguments));
    case pcrAppointmentRoute:
      return MaterialPageRoute(
          builder: (context) =>
              PickAppointmentScreen(settings.arguments, settings.arguments));
    case successfullRoute:
      return MaterialPageRoute(builder: (context) => SuccessfullPickedScreen());
    case centersRoute:
      return MaterialPageRoute(
          builder: (context) => CentersScreen(patient: settings.arguments));

// Vaccine Section
    case vaccineRoute:
      return MaterialPageRoute(
          builder: (context) =>
              VaccineBoardScreen(patient: settings.arguments));
    case vaccineCentersRoute:
      return MaterialPageRoute(
          builder: (context) =>
              VaccineCentersScreen(patient: settings.arguments));
    case vaccineAppointmentRoute:
      return MaterialPageRoute(
          builder: (context) => PickVaccineAppointmentScreen(
              settings.arguments, settings.arguments));
    case successfullVaccineRoute:
      return MaterialPageRoute(
          builder: (context) => SuccessfullPickedVaccineScreen());
  }
  return null;
}
