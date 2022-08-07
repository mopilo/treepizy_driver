import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/auth/screens/otp/otp_screen.dart';

class WelcomeTreepizy extends StatelessWidget {
  const WelcomeTreepizy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "BACK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Welcome to Treepizy",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      onTap: () {},
                      elevation: 3,
                      color: Colors.white,
                      fontSize: 16,
                      colorText: Colors.grey,
                      buttonText: 'Enter your phone number',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: RichText(
                      text: const TextSpan(
                          text: 'By creating and account, you agree to our ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ))
                          ]),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const OtpScreen())),
                      isIcon: true,
                      elevation: 3,
                      color: Colors.white,
                      fontSize: 16,
                      colorText: Colors.grey,
                      buttonText: 'Continue',
                    ),
                  ],
                )
              ]))),
    );
  }
}
