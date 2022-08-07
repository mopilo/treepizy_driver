import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/utils/themes.dart';
import 'package:treepizy_driver/features/onboarding/widget/onboarding_button.dart';
import 'package:treepizy_driver/features/onboarding/widget/onboarding_text.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/city_driver.png", fit: BoxFit.cover,)),
          const Text("Earn money when you... ",
              style: TextStyle(
                  color: CustomColors.dark,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
              const SizedBox(height: 31),
              const OnboardingText(color: CustomColors.dark, fontWeight: FontWeight.w300),
              const SizedBox(height: 137),
              OnboardingButton()
        ],
      ),
    );
  }

}
