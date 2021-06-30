export '../screens/Applicant/Dashboard/dash_board.dart';
export '../screens/Applicant/vaccine_pcr/vaccine_pcr.dart';
export '../screens//Applicant/vaccine_pcr/pcr/pcr_board/pcr_dashboard.dart';
export '../screens//Applicant/vaccine_pcr/pcr/pick_appontment/pick_ppointment.dart';
export '../screens/Applicant/vaccine_pcr/pcr/successful_picked/successful_picked.dart';
export '../screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_centers.dart';
export '../screens/JdJk/Dashboard/dash_board.dart';

import 'package:get_it/get_it.dart';
import 'package:vaccine8/service/rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  //services
  dependency.registerLazySingleton<RestService>(
    () => RestService( 
      baseUrl: 'http://192.168.68.103:3000', //with Local Json-server
    ),
  );
}