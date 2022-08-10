
import 'package:flutter/material.dart';

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
                 DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                        Colors.black54.withOpacity(.7),
                        Colors.black54.withOpacity(.7),
                      ])),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/brand_medium.png")),
                ),
                Positioned(
                  bottom: 40,
                  left: 0, right: 0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: const [
                          Text(
                            "Earn more", 
                            style: TextStyle(color: Colors.white, 
                            fontSize: 24, 
                            fontFamily: 'CreatoDisplay', 
                            fontWeight: FontWeight.w600), 
                            textAlign: TextAlign.center
                          ),
                          SizedBox(height: 21),
                          Text(
                              "Provides, rides, deliver items \nor transport goods",
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200, height: 1.5),
                              textAlign: TextAlign.center)
                        ],
                      )),
                ),
              ],
            )),
            Expanded(
              flex: 1,
              child: Container(
                height: 52, width: 52,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white,),
              ),
            )
      ]),
    );
  }
}
