import 'package:vaccine8/models/medicine.dart';

abstract class MedicineService{

Future <List<Medicine>> getMedicineList(int appoinmentId);
Future <Medicine> addMedicineList(Medicine medicine);


}