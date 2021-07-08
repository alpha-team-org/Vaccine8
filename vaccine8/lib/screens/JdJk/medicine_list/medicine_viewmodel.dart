import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/medicine.dart';
import 'package:vaccine8/screens/JdJk/symptoms/symptoms_viewmodel.dart';
import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/medicine/medicine_service.dart';

class MedicineViewmodel extends Viewmodel {
  MedicineService get service => dependency();

  Appointment appointment = dependency<SymptomsViewmodel>().appointment;

  List<Medicine> medicins;
  Medicine medicin = Medicine();
  Future<void> getMedicines() async {
    turnBusy();
    medicins = await service.getMedicineList(appointment.id);
    turnIdle();
  }

  Future<void> addMedicine() async {
    turnBusy();
    medicin.appointmentId = appointment.id;
    final p = await service.addMedicineList(medicin);
    turnIdle();
  }
}
