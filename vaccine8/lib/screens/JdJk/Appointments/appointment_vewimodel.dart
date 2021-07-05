import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';

class DrAppointmentViewmodel extends Viewmodel {
  List<User> user = [User()];
  List<Appointment> appointments;

  AppointmentService get service => dependency();

  Future<void> getAppointments() async {
    turnBusy();
    appointments = await service.getAllAppoinments();

    for (var i = 0; i < appointments.length; i++) {
      final p = await service.getUserById(appointments[i].applicantId);
      user.add(p);
    }
    turnIdle();
  }

  Future<void> updateAppointment(Appointment app) async {
    turnBusy();
    final appoint = await service.updateApp(app);
    turnIdle();
  }
}
