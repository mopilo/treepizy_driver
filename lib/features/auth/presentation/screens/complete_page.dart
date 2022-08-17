import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/welcome_back/login.dart';


class CompletePage extends StatelessWidget {
  CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 60),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Welcome back",
              style: TextStyle(
                  color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 21),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 19),
            child: TextWidget(
              text:
                  "Your Password has been Reset. \nYou can continue using your app.",
              size: 16,
            ),
          ),
          SizedBox(height: 457),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 19),
              width: double.infinity,
              height: 45,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        TextWidget(
                          text: "Start using Treepizy",
                          size: 12,
                          appcolor: Colors.white,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.east_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => WelcomeBackScreen()));
                  }))
        ],
      ),
    );
  }
}
