import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final Color color;
  final FontWeight fontWeight;
  const OnboardingText({Key? key, required this.color, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Provides, rides, deliver items \nor transport goods",
        style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: fontWeight,
            height: 1.5),
        textAlign: TextAlign.center);
  }
}
