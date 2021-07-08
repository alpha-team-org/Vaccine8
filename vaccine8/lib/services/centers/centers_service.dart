// import 'package:flutter/cupertino.dart';

import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/Centers.dart';

abstract class CenterService {
  Future<List<Centers>> getCenters();
  Future<Appointment> pickapp(Appointment appointment);
  Future<Appointment> updateapp(Appointment appointment);
}
