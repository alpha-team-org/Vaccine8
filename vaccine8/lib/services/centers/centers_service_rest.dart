import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/service/rest.dart';
import 'package:vaccine8/services/centers/centers_service.dart';

class CenterServiceRest implements CenterService {

  RestService  rest = dependency();

Future<List<Centers>> getPcrCenters()async{
  final json = await rest.get("pcrCenters");
  return json.map((e)=>Centers.fromJson(e)).toList();
}





}