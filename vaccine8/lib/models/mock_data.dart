import 'package:flutter/material.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

import 'Centers.dart';

final patientList = <Patient>[
  Patient(name: "abdalla", photoUrl: "assets/user.jpg", address: "skudai")
];
final centerList = <Centers>[
  Centers(
    name:  "skuai hospital",
    address:  "skudai",
    appointments:  [
        Appointment(
          day: DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1),
          time: [
             DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1 , 13 ,00),
             DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1 , 9 ,30),
             DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1 , 10 ,00),
             DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1 , 11 ,00),
             DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 1 , 12 ,00),
            //  "09:30",
            //  "10:00",
            //  "10:30",
            //  "11:00",
            //  "11:30",
            //  "12:00",
          ],
        ),
        // Appointment(
        //   day: DateTime.utc(DateTime.now().year, DateTime.now().month,
        //       DateTime.now().day + 2),
        //   time: [
        //      "09:00",
        //      "13:30",
        //      "10:00",
        //      "10:30",
        //      "11:00",
        //      "11:30",
        //      "12:00",
        //   ],
        // ),
        // Appointment(
        //   day: DateTime.utc(DateTime.now().year, DateTime.now().month,
        //       DateTime.now().day + 3),
        //   time: [
        //      "09:00",
        //      "09:30",
        //      "10:00",
        //      "10:30",
        //      "11:00",
        //      "11:30",
        //      "12:00",
        //   ],
        // ),
      ],
    imgRout:  'assets/hospital.jpg'),
  // Centers(
  //    name: "utm hospital",
  //     address: "utm",
  //     appointments:[
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 1),
  //         time: [
  //            "13:00",
  //            "09:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2),
  //         time: [
  //            "09:00",
  //            "13:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 3),
  //         time: [
  //            "09:00",
  //            "09:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //     ],
  //   imgRout:  'assets/hospital.jpg'),
  // Centers(
  //     name: "perdana hospital",
  //     address:"perdana",
  //    appointments: [
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 1),
  //         time: [
  //            "13:00",
  //            "09:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2),
  //         time: [
  //            "09:00",
  //            "13:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //       Appointment(
  //         day: DateTime.utc(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 3),
  //         time: [
  //            "09:00",
  //            "09:30",
  //            "10:00",
  //            "10:30",
  //            "11:00",
  //            "11:30",
  //            "12:00",
  //         ],
  //       ),
  //     ],
  //    imgRout: 'assets/hospital.jpg'),
];
