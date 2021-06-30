import 'package:get_it/get_it.dart';
import 'package:vaccine8/services/auth/auth_service.dart';
import 'package:vaccine8/services/auth/auth_service_secured_rest.dart';
import 'package:vaccine8/services/rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services

  dependency.registerLazySingleton<RestService>(
    () => RestService(
        // baseUrl: 'http://192.168.0.5:3000',  // with Local JSON-server
        baseUrl:
            'http://192.168.100.40:5001/vaccine8-dcf02/us-central1/api', // Firebase emulator
        // baseUrl: 'https://us-central1-mvvm-frontend-and-mvc-backend.cloudfunctions.net/api',
        enableSession: true // Firebase REST live
        ),
  );

  dependency.registerLazySingleton<AuthService>(() => AuthServiceSecuredRest());

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceSecuredRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  // dependency.registerLazySingleton(() => UserViewmodel());
}
