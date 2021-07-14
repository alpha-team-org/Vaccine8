import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_viewnodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_viewmodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
// import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/centers/centers_service.dart';
// import 'package:vaccine8/viewmodel.dart';

class PcrViewModel extends Viewmodel {
  CenterService get service => dependency();
  Appointment _appointment = Appointment();
  get appointment => _appointment;
  set appointment(value) => _appointment = value;
  int index;
  get center => (centers != null && index != null) ? centers[index] : null;

// Centers center ;
  List<Centers> pcrCenters;
  get selected => index;
  set selected(value) => index = value;

  get centers {
    return pcrCenters;
  }

  Future<List<Centers>> getHospital() async {
    turnBusy();
    pcrCenters = await service.getCenters();
    selected = null;
    turnIdle();
    return pcrCenters;
  }

  dynamic userId;
  get id => userId;
  get app => dependency<PcrDashboardViewmodel>().checkAppointment;

  Future<void> addAppointment() async {
    turnBusy();

    dynamic p;
    if (app == null) {
      p = await service.pickapp(appointment);
    } else {
      app.day = appointment.day;
      p = await service.updateapp(app);
    }

    turnIdle();
    return p;
  }
}
