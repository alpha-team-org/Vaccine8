import 'package:get_it/get_it.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_viewnodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_viewmodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_viewmodel.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_centers/vaccine_viewmodel.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';
import 'package:vaccine8/services/appointments/appointments_service.dart';
import 'package:vaccine8/services/appointments/appointments_service_rest.dart';
import 'package:vaccine8/services/auth/auth_service.dart';
import 'package:vaccine8/services/auth/auth_service_secured_rest.dart';
import 'package:vaccine8/services/centers/centers_service.dart';
import 'package:vaccine8/services/centers/centers_service_rest.dart';
import 'package:vaccine8/services/rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services

  dependency.registerLazySingleton<RestService>(
    () => RestService(
      baseUrl: 'http://192.168.68.107:3000', // with Local JSON-server
      // baseUrl:
      // 'http://192.168.100.40:5001/vaccine8-dcf02/us-central1/api', // Firebase emulator
      // baseUrl: 'https://us-central1-mvvm-frontend-and-mvc-backend.cloudfunctions.net/api',
      // enableSession: true // Firebase REST live
    ),
  );


  dependency.registerLazySingleton<AuthService>(() => AuthServiceSecuredRest());
  dependency.registerLazySingleton<CenterService>(() => CenterServiceRest());
  dependency.registerLazySingleton<AppointmentService>(() => AppointmentServiceRest());

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceSecuredRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  // dependency.registerLazySingleton(() => UserViewmodel());
  // dependency.registerLazySingleton(() => PcrViewModel());
  dependency.registerLazySingleton(() => LoginViewmodel());
  dependency.registerLazySingleton(() => VaccineViewModel());
  dependency.registerLazySingleton(() => PcrViewModel());
  dependency.registerLazySingleton(() => VaccineDashboardViewmodel());
  dependency.registerLazySingleton(() => PcrDashboardViewmodel());
}
