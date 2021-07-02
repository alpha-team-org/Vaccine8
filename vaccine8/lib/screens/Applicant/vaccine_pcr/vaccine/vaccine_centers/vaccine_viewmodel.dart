import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
// import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/centers/centers_service.dart';
// import 'package:vaccine8/viewmodel.dart';

class VaccineViewModel extends Viewmodel {
  CenterService get service => dependency();
  Appointment _appointment =Appointment();
  get appointment => _appointment;
  set appointment(value) => _appointment = value;
  int index;
  Centers center;
  List<Centers> pcrCenters;
  get selected => index;
  set selected(value) => index = value;
  get centers => pcrCenters;

  Future<List<Centers>> getHospital() async {
    turnBusy();
    pcrCenters = await service.getCenters();
    selected = null;
    turnIdle();
    return pcrCenters;
  }
  int userId;
  Future<void> addAppointment()async {
   turnBusy(); 
     
   appointment.userId = userId;

    final p = await service.pickapp(appointment);
     turnIdle(); 
  }
}
