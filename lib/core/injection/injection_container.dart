
import 'package:treepizy_driver/core/data/session_manager.dart';
import 'package:treepizy_driver/core/environment/environment.dart';
import 'package:get_it/get_it.dart';
import 'package:treepizy_driver/core/network/network_client.dart';
import 'package:treepizy_driver/core/routing/compass.dart';
import 'package:treepizy_driver/features/auth/data/datasource/auth_service.dart';
import 'package:treepizy_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:treepizy_driver/features/auth/presentation/provider/vehicle_provider.dart';
import 'package:treepizy_driver/features/home/provider/home_provider.dart';
import 'package:treepizy_driver/features/splash/splash_bloc.dart';

import '../../features/auth/data/datasource/vehicle_service.dart';


final inject = GetIt.instance;
final sessionManager = SessionManager();

Future<void> initializeCore({required Environment environment}) async {
  Env.environment = environment;
  await _initializeCore();
  _initServices();
  _initProviders();
  _initBloc();
  _initDataSources();
  _initDataRepositories();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  await sessionManager.initializeSession();
  inject.registerLazySingleton<SessionManager>(() => sessionManager);
}

/// Initialize providers here
void _initProviders() {
  inject.registerLazySingleton<HomeProvider>(() => HomeProvider());
  inject.registerLazySingleton<VehicleProvider>(() => VehicleProvider(inject()));
}

/// Initialize bloc's here
void _initBloc() {
  inject.registerFactory<SplashCubit>(() => SplashCubit(inject()));
  inject.registerLazySingleton<AuthBloc>(() => AuthBloc(inject()));
  // inject.registerLazySingleton<MoveCubit>(() => MoveCubit(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {}

/// Initialize data repositories implementations
void _initDataRepositories() {}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkClient>(
      () => NetworkClient(baseUrl: Env.coreBaseUrl));
  inject.registerLazySingleton<AuthService>(
      () => AuthService(networkService: inject()));
  inject.registerLazySingleton<VehicleService>(
      () => VehicleService(networkClient: inject()));
  inject.registerSingleton<Compass>(CompassImpl());
  
}

/// Initialize usecases here
void _initializeUsecase() {}
