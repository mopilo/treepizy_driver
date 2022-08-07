import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/screen/welcome_back/welcome_login_screen.dart';

class SplashScreenAuth extends StatelessWidget {
  const SplashScreenAuth({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "treepizy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Driver",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const WelcomeBackScreen())),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Login with Phone",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 33.0),
                      child: Text(
                        "Or Create My Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
