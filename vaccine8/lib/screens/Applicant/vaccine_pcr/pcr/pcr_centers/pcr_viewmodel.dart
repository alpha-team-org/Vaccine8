import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/screens/viewmodel.dart';
// import 'package:vaccine8/screens/viewmodel.dart';
import 'package:vaccine8/services/centers/centers_service.dart';
// import 'package:vaccine8/viewmodel.dart';

class PcrViewModel extends Viewmodel{

CenterService get service => dependency();

int index;
Centers center ;
List<Centers> pcrCenters;
get selected => index;
set selected(value)=>index=value;

Future<void> getHospital() async{
  turnBusy();
  pcrCenters =await service.getPcrCenters();
  selected = null;
  turnIdle();
}



}