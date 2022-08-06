import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/utils/themes.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/driver_onboarding.png",
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
              ],
            )),
            Expanded(
              flex: 1,
              child: Container(
                color: CustomColors.fadedWhite
              ),
            )
      ]),
    );
  }
}
