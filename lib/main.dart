import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/routing/compass.dart';
import 'package:treepizy_driver/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:treepizy_driver/features/splash/splash_screen_auth.dart';

import 'core/data/provider.dart';
import 'core/environment/environment.dart';
import 'core/injection/injection_container.dart';
import 'features/splash/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore(environment: Environment.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers.getProviders,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: inject.get<Compass>().navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'CreatoDisplay'
          ),
          home: const SplashScreen(),
        )
      
    );
  }
}
