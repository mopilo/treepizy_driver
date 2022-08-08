import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import '../../../core/widgets/button_widget.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thank You!',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Thank you for registering with Company. Please complete your registration and be activated by visiting our office.',
                style: TextStyle(
                    wordSpacing: 1,
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 380,
              ),
              ButtonWidget(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ThankYouScreen())),
                isIcon: true,
                buttonText: 'Go to Profile',
                colorText: AppColors.white,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
