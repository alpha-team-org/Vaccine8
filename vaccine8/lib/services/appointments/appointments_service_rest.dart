import 'dart:math';

import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/user.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';
import 'package:vaccine8/services/rest.dart';

class AppointmentServiceRest implements AppointmentService {
  RestService get rest => dependency();

  Future<List<Appointment>> getPcrAppoinments(userId) async {
    final List json =
        await rest.get("Appointment?type=pcr&applicantId=${userId}");
    if (json.length == 0) return null;
    return json.map((e) => Appointment.fromJson(e)).toList();
  }

  Future<List<Appointment>> getVacAppoinments(userId) async {
    final List json =
        await rest.get("Appointment?type=vaccine&applicantId=${userId}");
    if (json.length == 0) return null;
    return json.map((e) => Appointment.fromJson(e)).toList();
  }

  Future<Appointment> updateApp(appointment) async {
    final json =
        await rest.put("appointment/${appointment.id}", data: appointment);
  }

  Future<List<Appointment>> getAllAppoinments() async {
    final List json = await rest.get("appointment");
    final app = json.map((e) => Appointment.fromJson(e)).toList();
    return app;
  }

  Future<User> getUserById(userId) async {
    final json = await rest.get("Applicant/${userId}");
    return User.fromJson(json);
  }
}
