import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/medicine.dart';
import 'package:vaccine8/services/medicine/medicine_service.dart';
import 'package:vaccine8/services/rest.dart';

class MedicineServiceRest extends MedicineService {
  RestService get rest => dependency();

  Future<List<Medicine>> getMedicineList(appoinmentId) async {
    try {
      final List json = await rest.get("medicines?appointmentId=$appoinmentId");

      if (json == null || json.length == 0) return null;

      return json.map((e) => Medicine.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<Medicine> addMedicineList(Medicine medicine) async {
    try {
      final json = await rest.post("medicines", data: medicine);

      if (json == null) return null;

      return Medicine.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
