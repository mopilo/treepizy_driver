import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';

import 'welcome_login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
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
          bottom: 60,
          left: 20, right: 20,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonWidget(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const WelcomeBackScreen())),
                isIcon: true,
                color: Colors.white,
                colorText: Colors.black,
                buttonText: 'Login with Phone',
              ),
              const SizedBox(
                height: 38,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 33.0),
                child: Text(
                  "Or Create My Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
