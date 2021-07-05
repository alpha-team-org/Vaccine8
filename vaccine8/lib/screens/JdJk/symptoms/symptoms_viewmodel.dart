import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/JdJk/Appointments/appointment_vewimodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';

class SymptomsViewmodel extends Viewmodel 
{
  get service => dependency<AppointmentService>();
    List<User> user = [User()];
  List<Appointment> appointments;
  int _index;
  get index =>_index;
  set index(value) =>_index=value;
Appointment get appointment => (index!=null && appointments!=null) ?appointments[index] :null; 
 
  Future<void> getAppointments()async{
    // await dependency<DrAppointmentViewmodel>().getAppointments();
        turnBusy();
    appointments = await service.getAllAppoinments();
  index = null;
    for (var i = 0; i < appointments.length; i++) {
      final p = await service.getUserById(appointments[i].applicantId);
      user.add(p);
    }
    turnIdle();
  }
  Future<void> updateSymptoms(Appointment appointment) async {
    turnBusy();
    final app = await service.updateApp(appointment);
    turnIdle();

  }
}
