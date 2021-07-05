import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_viewmodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_viewmodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';

class PcrDashboardViewmodel extends Viewmodel {
  AppointmentService service = dependency();

  List<Appointment> appointment;
  get checkAppointment {
    if (appointment == null)
      return null;
    else
      return appointment[0];
  }

  get userId => dependency<PcrViewModel>().id;

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
    final p = await service.updateApp(appointment[0]);
    turnIdle();
  }
}
