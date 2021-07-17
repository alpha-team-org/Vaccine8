import 'package:get_it/get_it.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_viewnodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_viewmodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_viewmodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_viewmodel.dart';
import 'package:vaccine8/screens/JdJk/Appointments/appointment_vewimodel.dart';
import 'package:vaccine8/screens/JdJk/medicine_list/medicine_viewmodel.dart';
// import 'package:vaccine8/screens/JdJk/medicine_list/medicine_viewmodel.dart';
import 'package:vaccine8/screens/JdJk/symptoms/symptoms_viewmodel.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';
import 'package:vaccine8/services/appointments/appointments_service_rest.dart';
import 'package:vaccine8/services/auth/auth_service.dart';
import 'package:vaccine8/services/auth/auth_service_secured_rest.dart';
import 'package:vaccine8/services/centers/centers_service.dart';
import 'package:vaccine8/services/centers/centers_service_rest.dart';
import 'package:vaccine8/services/medicine/medicine_service.dart';
import 'package:vaccine8/services/medicine/medicine_service_rest.dart';
import 'package:vaccine8/services/rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services

  dependency.registerLazySingleton<RestService>(
    () => RestService(
        // baseUrl: 'http://192.168.100.40:3000', // with Local JSON-server
        // baseUrl: 'https://us-central1-mvvm-frontend-and-mvc-backend.cloudfunctions.net/api',
        baseUrl:
            'http://192.168.100.40:5001/vaccine8-dcf02/us-central1/api', // Firebase emulator
        enableSession: false // Firebase REST live
        ),
  );

  dependency.registerLazySingleton<AuthService>(() => AuthServiceSecuredRest());
  dependency.registerLazySingleton<CenterService>(() => CenterServiceRest());
  dependency.registerLazySingleton<AppointmentService>(
      () => AppointmentServiceRest());
  dependency
      .registerLazySingleton<MedicineService>(() => MedicineServiceRest());

  // Viewmodels
  // dependency.registerLazySingleton(() => UserViewmodel());
  // dependency.registerLazySingleton(() => PcrViewModel());
  dependency.registerLazySingleton(() => LoginViewmodel());
  dependency.registerLazySingleton(() => VaccineViewModel());
  dependency.registerLazySingleton(() => PcrViewModel());
  dependency.registerLazySingleton(() => VaccineDashboardViewmodel());
  dependency.registerLazySingleton(() => PcrDashboardViewmodel());
  dependency.registerLazySingleton(() => DrAppointmentViewmodel());
  dependency.registerLazySingleton(() => SymptomsViewmodel());
  dependency.registerLazySingleton(() => MedicineViewmodel());
}
