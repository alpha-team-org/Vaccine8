import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

import 'Centers.dart';

final patientList = <Patient>[Patient("abdalla", "assets/user.jpg", "skudai")];
final centerList = <Centers>[
  Centers(
      "skuai hospital",
      "skudai",
      [
        Appointment(DateTime.parse("2021-06-20 09:00:04Z")),
      ],
      'assets/hospital.jpg'),
  Centers(
      "utm hospital",
      "utm",
      [
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 9)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 9, 30)),
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 10)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 10, 30)),
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 11)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 11, 30)),
      ],
      'assets/hospital.jpg'),
  Centers(
      "perdana hospital",
      "perdana",
      [
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 9)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 9, 30)),
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 10)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 10, 30)),
        Appointment(DateTime.utc(DateTime.now().year, DateTime.now().day, 11)),
        Appointment(
            DateTime.utc(DateTime.now().year, DateTime.now().day, 11, 30)),
      ],
      'assets/hospital.jpg'),
];
