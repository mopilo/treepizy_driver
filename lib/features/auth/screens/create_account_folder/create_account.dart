import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/text_form_field.dart';
import 'package:treepizy_driver/features/utils/color.dart';
import '../../../../core/widgets/button_widget.dart';
import '../card_folder/add_card_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

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
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "BACK",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/profile.png",
                    width: 200,
                    height: 210,
                  ),
                  Image.asset(
                    "assets/camera.png",
                    width: 200,
                    height: 210,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            EditTextForm(
              // controller: controller,
              readOnly: false,
              label: 'First name',
            ),
            EditTextForm(
              // controller: controller,
              readOnly: false,
              label: 'Last name',
            ),
            EditTextForm(
              // controller: controller,
              readOnly: false,
              label: 'Email',
            ),
            EditTextForm(
              // controller: controller,
              readOnly: false,
              label: 'Phone No...',
            ),
            EditTextForm(
              // controller: controller,
              readOnly: false,
              label: 'Password',
              suffixWidget: Image.asset(
                'assets/view.png',
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddCardScreen())),
              isIcon: true,
              color: Colors.white,
              colorText: AppColors.grey,
              buttonText: 'Create Account',
            ),
          ],
        )),
      ),
    );
  }
}
