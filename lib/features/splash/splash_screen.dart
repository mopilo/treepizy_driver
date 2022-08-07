import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/splash/splash_screen_auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SplashScreenAuth())),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/bg.png",
              fit: BoxFit.cover,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      colors: [
                    Colors.black45.withOpacity(.7),
                    Colors.black45.withOpacity(.7),
                  ])),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "treepizy",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 75,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Driver",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
