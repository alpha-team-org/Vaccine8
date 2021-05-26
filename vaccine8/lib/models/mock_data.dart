import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

import 'Centers.dart';

final patientList = <Patient>[Patient("abdalla", "assets/user.jpg","skudai")];
final centerList = <Centers>[
Centers("skuai hospital", "skudai", [
  Appointment(DateTime.now().add(Duration(days:1)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:2)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:3)),[8,9,20]),
  
],'assets/hospital.jpg'),
Centers("utm hospital", "utm", [
  Appointment(DateTime.now().add(Duration(days:1)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:2)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:3)),[8,9,20]),
  
],'assets/hospital.jpg'),
Centers("perdana hospital", "perdana", [
  Appointment(DateTime.now().add(Duration(days:1)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:2)),[8,9,20]),
  Appointment(DateTime.now().add(Duration(days:3)),[8,9,20]),
  
],'assets/hospital.jpg'),





  
];