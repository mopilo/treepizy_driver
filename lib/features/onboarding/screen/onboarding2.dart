import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/utils/themes.dart';
import 'package:treepizy_driver/features/auth/presentation/provider/vehicle_provider.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/welcome_back/welcome_screen.dart';
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
          Center(
              child: Image.asset(
            "assets/city_driver.png",
            fit: BoxFit.cover,
          )),
          const Text("Earn money when you... ",
              style: TextStyle(
                  color: CustomColors.dark,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
          const SizedBox(height: 31),
          const OnboardingText(
              color: CustomColors.dark, fontWeight: FontWeight.w300),
          const SizedBox(height: 137),
          InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Welcome()));
              },
              child: const OnboardingButton())
        ],
      ),
    );
  }
}
