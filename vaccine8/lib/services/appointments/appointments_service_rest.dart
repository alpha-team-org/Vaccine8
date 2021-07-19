import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/user.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';
import 'package:vaccine8/services/rest.dart';

class AppointmentServiceRest implements AppointmentService {
  RestService get rest => dependency();

  Future<List<Appointment>> getPcrAppoinments(userId) async {
    try {
      final List json =
          await rest.get("appointments?type=pcr&applicantId=$userId");

      if (json.length == 0 || json.length == 0) return null;

      return json.map((e) => Appointment.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<Appointment>> getVacAppoinments(userId) async {
    try {
      final List json =
          await rest.get("appointments?type=vaccine&applicantId=$userId");

      if (json == null || json.length == 0) return null;

      return json.map((e) => Appointment.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<Appointment> updateApp(appointment) async {
    try {
      final json =
          await rest.patch("appointments/${appointment.id}", data: appointment);

      if (json == null) return null;

      return Appointment.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<List<Appointment>> getAllAppoinments() async {
    try {
      final List json = await rest.get("appointments");

      if (json == null || json.length == 0) return null;

      return json.map((e) => Appointment.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<User> getUserById(userId) async {
    try {
      final json = await rest.get("users/$userId");

      if (json == null || json.length == 0) return null;

      return User.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
