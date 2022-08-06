import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
          new DecoratedBox(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                  Colors.black45,
                  Colors.black45,
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
    );
  }
}
