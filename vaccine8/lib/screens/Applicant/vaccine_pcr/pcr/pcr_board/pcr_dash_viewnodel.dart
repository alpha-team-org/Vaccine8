import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';

class PcrDashboardViewmodel extends Viewmodel {
  AppointmentService service = dependency();

  List<Appointment> appointment;
  Appointment get checkAppointment {
    if (appointment == null)
      return null;
    else
      return appointment[0];
  }

  get userId => dependency<LoginViewmodel>().user.id;
  get userName => dependency<LoginViewmodel>().user.name;

  bool checkAppointmentType() {
    bool check;

    if (appointment == null) return false;
    for (var e in appointment) {
      (e.type == "pcr") ? check = true : check = false;
    }

    return check;
  }

  Future<void> appointmentList() async {
    turnBusy();
    appointment = await service.getPcrAppoinments(userId);
    turnIdle();
  }

  Future<void> updateApp() async {
    turnBusy();
    await service.updateApp(appointment[0]);
    turnIdle();
  }
}
