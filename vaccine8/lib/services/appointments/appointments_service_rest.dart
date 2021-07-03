import 'dart:math';

import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';
import 'package:vaccine8/services/rest.dart';

class AppointmentServiceRest implements AppointmentService {
  RestService get rest => dependency();

  Future<List<Appointment>> getPcrAppoinments(userId) async {
    final List json = await rest.get("Appointment?type=pcr");
    if (json.length == 0) return null;
    return json.map((e) => Appointment.fromJson(e)).toList();
  }
  Future<List<Appointment>> getVacAppoinments(userId) async {
    final List json = await rest.get("Appointment?type=vaccine");
    if (json.length == 0) return null;
    return json.map((e) => Appointment.fromJson(e)).toList();
  }

  Future<Appointment> updateapp(Appointment appointment) async {
    final json =
        await rest.put("appointment/${appointment.id}", data: appointment);
  }
}
