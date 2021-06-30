import 'package:flutter/material.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

import 'Centers.dart';

final patientList = <Patient>[
  Patient(name: "abdalla", photoUrl: "assets/user.jpg", address: "skudai")
];
final centerList = <Centers>[
  Centers(
      "skuai hospital",
      "skudai",
      [
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1),
          date: [
            TimeOfDay(hour: 13, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 13, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
      ],
      'assets/hospital.jpg'),
  Centers(
      "utm hospital",
      "utm",
      [
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1),
          date: [
            TimeOfDay(hour: 13, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 13, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
      ],
      'assets/hospital.jpg'),
  Centers(
      "perdana hospital",
      "perdana",
      [
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1),
          date: [
            TimeOfDay(hour: 13, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 13, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3),
          date: [
            TimeOfDay(hour: 09, minute: 00),
            TimeOfDay(hour: 09, minute: 30),
            TimeOfDay(hour: 10, minute: 00),
            TimeOfDay(hour: 10, minute: 30),
            TimeOfDay(hour: 11, minute: 00),
            TimeOfDay(hour: 11, minute: 30),
            TimeOfDay(hour: 12, minute: 00),
          ],
        ),
      ],
      'assets/hospital.jpg'),
];
