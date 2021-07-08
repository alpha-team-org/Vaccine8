import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/medicine.dart';
import 'package:vaccine8/services/medicine/medicine_service.dart';
import 'package:vaccine8/services/rest.dart';

class MedicineServiceRest extends MedicineService {
  RestService get rest => dependency();

  Future<List<Medicine>> getMedicineList(int appoinmentId) async {
    final List json = await rest.get("medicine?appoinmentId=${appoinmentId}");
    return json.map((e) => Medicine.fromJson(e)).toList();
  }

  Future<Medicine> addMedicineList(Medicine medicine) async {
    final p = await rest.post("medicine", data: medicine);
  }
}
