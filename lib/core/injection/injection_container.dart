
// import 'package:treepizy_driver/core/data/session_manager.dart';
// import 'package:treepizy_driver/core/environment/environment.dart';


// final inject = GetIt.instance;
// final sessionManager = SessionManager();

// Future<void> initializeCore({required Environment environment}) async {
//   Env.environment = environment;
//   await _initializeCore();
//   _initServices();
//   _initProviders();
//   _initBloc();
//   _initDataSources();
//   _initDataRepositories();
//   _initializeUsecase();
// }

// /// Initialize the core functions here
// Future<void> _initializeCore() async {
//   await sessionManager.initializeSession();
//   inject.registerLazySingleton<SessionManager>(() => sessionManager);
// }

// /// Initialize providers here
// void _initProviders() {
//   // inject.registerLazySingleton<HomeProvider>(() => HomeProvider(inject()));
//   // inject
//   //     .registerLazySingleton<ProfileProvider>(() => ProfileProvider(inject()));
//   // inject.registerLazySingleton<MoveProvider>(() => MoveProvider(inject()));
//   // inject.registerLazySingleton<SetUpProvider>(() => SetUpProvider(inject()));
// }

// /// Initialize bloc's here
// void _initBloc() {
//   // inject.registerFactory<SplashCubit>(() => SplashCubit(inject()));
//   // inject.registerLazySingleton<AuthCubit>(() => AuthCubit(inject()));
//   // inject.registerLazySingleton<MoveCubit>(() => MoveCubit(inject()));
// }

// /// Initialize data sources implementations
// void _initDataSources() {}

// /// Initialize data repositories implementations
// void _initDataRepositories() {}

// /// Initialize services's here
// void _initServices() {
//   // inject.registerLazySingleton<NetworkClient>(
//   //     () => NetworkClient(baseUrl: Env.coreBaseUrl));
//   // inject.registerLazySingleton<AuthService>(
//   //     () => AuthService(networkService: inject()));
//   // inject.registerSingleton<Compass>(CompassImpl());
//   // inject.registerLazySingleton<HomeService>(
//   //     () => HomeService(networkService: inject()));
//   // inject.registerLazySingleton<ProfileService>(
//   //     () => ProfileService(networkService: inject()));
//   // inject.registerLazySingleton<MoveService>(
//   //     () => MoveService(networkService: inject()));
//   // inject.registerLazySingleton<ChatService>(
//   //     () => ChatService(networkService: inject()));
//   // inject.registerLazySingleton<SetUpService>(
//   //     () => SetUpService(networkService: inject()));
// }

// /// Initialize usecases here
// void _initializeUsecase() {}
