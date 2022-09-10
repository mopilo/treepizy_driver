import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/button_widget.dart';
import '../../core/widgets/text_form_field.dart';

class NewAccountScreen extends StatelessWidget {
  NewAccountScreen({super.key});

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(40, 1, 1, 18),
                  blurRadius: 25.0,
                  spreadRadius: 170,
                ),
              ],
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 21,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "NEW ACCOUNT",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              // height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EditTextForm(
                    controller: bankNameController,
                    readOnly: false,
                    label: 'Bank Name',
                    obscureText: false,
                    suffixIcon: Icons.arrow_drop_down,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditTextForm(
                    controller: bankNameController,
                    readOnly: false,
                    label: 'Account Number',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditTextForm(
                    controller: bankNameController,
                    readOnly: false,
                    label: 'Account Name',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ButtonWidget(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewAccountScreen())),
                    isIcon: false,
                    isJustText: true,
                    color: Colors.black,
                    colorText: Colors.white,
                    buttonText: 'Link to Profile',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
