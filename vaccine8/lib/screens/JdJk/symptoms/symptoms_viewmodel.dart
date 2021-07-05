import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/JdJk/Appointments/appointment_vewimodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';

class SymptomsViewmodel extends Viewmodel 
{
  get service => dependency<AppointmentService>();

  List<User> users = dependency<DrAppointmentViewmodel>().user;
  List<Appointment> appointments = dependency<DrAppointmentViewmodel>().appointments;

  Future<void> updateSymptoms(Appointment appointment) async {
    final app = await service.updateApp(appointment);
  }
}
