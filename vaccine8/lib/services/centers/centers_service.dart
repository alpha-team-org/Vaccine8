// import 'package:flutter/cupertino.dart';

import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';

abstract class CenterService {

Future<List<Centers>> getCenters();
Future<Appointment> pickapp(Appointment appointment);



}