import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/Centers.dart';

import 'package:vaccine8/services/centers/centers_service.dart';

import '../rest.dart';

class CenterServiceRest implements CenterService {
  RestService get rest => dependency();

  Future<List<Centers>> getCenters() async {
    try {
      final List json = await rest.get("centers");

      if (json == null || json.length == 0) return null;

      final centersList = json.map((e) => Centers.fromJson(e)).toList();

      return centersList;
    } catch (e) {
      return null;
    }
  }

  Future<Appointment> pickapp(appointment) async {
    try {
      final json = await rest.post("appointments", data: appointment);

      if (json == null) return null;

      return Appointment.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<Appointment> updateapp(Appointment appointment) async {
    try {
      final json =
          await rest.patch("appointments/${appointment.id}", data: appointment);

      if (json == null) return null;

      return Appointment.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
