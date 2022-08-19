import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';

import 'login.dart';
import 'sign_up.dart';

class WelcomeScreenRoute extends MaterialPageRoute<bool> {
  WelcomeScreenRoute() : super(builder: (_) => const Welcome());
}

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
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonWidget(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WelcomeBackScreen())),
                isIcon: true,
                color: Colors.white,
                colorText: Colors.black,
                buttonText: 'Login with Phone',
                fontSize: 15.sp,
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 33.w),
                  child: Text(
                    "Or Create My Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
