import 'package:flutter/material.dart';

import 'package:treepizy_driver/features/splash/splash_screen_auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeCore(environment: Environment.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'CreatoDisplay'
      ),
      home: const SplashScreenAuth(),
    );
  }
}
