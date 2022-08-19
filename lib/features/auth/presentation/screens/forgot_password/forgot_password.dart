import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/text_form_field.dart';
import 'package:treepizy_driver/features/auth/presentation/widgets/back_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const BackWidget(title: 'BACK')),
                  const SizedBox(
                height: 200,
              ),
              const Text(
                "It’s very easy!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "New password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              EditTextForm(
                controller: controller,
                readOnly: false,
                label: '****',
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Confirm password ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              EditTextForm(
                controller: controller,
                readOnly: false,
                label: '',
              ),
              const SizedBox(
                height: 130,
              ),
              ButtonWidget(
                onTap: () {},
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const WelcomeTreepizy())),
                isIcon: true,
                color: Colors.black,
                colorText: Colors.white,
                buttonText: 'Complete',
              ),
            ]),
          )),
    );
  }
}
