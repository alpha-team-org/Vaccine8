import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/Centers.dart';

import 'package:vaccine8/services/centers/centers_service.dart';

import '../rest.dart';

class CenterServiceRest implements CenterService {
  RestService get rest => dependency();

  Future<List<Centers>> getCenters() async {
    final List json = await rest.get("Centers");
    final p = json.map((e) => Centers.fromJson(e)).toList();
    return p;
  }

  Future<Appointment> pickapp(appointment) async {
    final json = await rest.post("Appointment", data: appointment);
  }

  Future<Appointment> updateapp(Appointment appointment) async {
    final json =
        await rest.put("appointment/${appointment.id}", data: appointment);
  }
}
