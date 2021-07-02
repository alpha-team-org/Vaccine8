
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/models/mock_data.dart';
import 'package:vaccine8/screens/Applicant/Dashboard/dash_board.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dashboard.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_centers.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pick_appontment/pick_ppointment.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/successful_picked/successful_picked.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/pick_appontment/pick_ppointment.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/successful_picked/successful_picked.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dashboard.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_centers.dart';
import 'package:vaccine8/screens/JdJk/Appointments/appointment_view.dart';
import 'package:vaccine8/screens/JdJk/Dashboard/dash_board.dart';
import 'package:vaccine8/screens/JdJk/medicine_list/medicine_view.dart';
import 'package:vaccine8/screens/JdJk/symptoms/symptoms_view.dart';
import 'package:vaccine8/screens/intro_screen/intro_screen.dart';
import 'package:vaccine8/screens/login/login_screen.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case introScreenRoute:
      return MaterialPageRoute(builder: (context) => IntroScreenState());

    case logindRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());

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
    case jdjkdashboardRout :
            return MaterialPageRoute(builder: 
            (context) => JDJKDasboardScreen());
    case jdjkAppointment:
    return MaterialPageRoute(builder: (context)=>AppointmentScreen());
    case jdjkSymptoms :
    return MaterialPageRoute(builder: (context)=>SymptomsScreem());
    case medicine:
    return MaterialPageRoute(builder: (context)=>MedicieScreen());
  return null;
}
}