import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/splash/splash_screen_auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                  Colors.black54,
                  Colors.black54,
                ])),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/brand.png")),
          ),
        ],
      ),
    );
  }
}
