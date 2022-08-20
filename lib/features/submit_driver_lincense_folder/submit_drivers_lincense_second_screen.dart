import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/button_widget.dart';
import '../utils/color.dart';

class SubmitDriversLincenseSecondScreen extends StatelessWidget {
  const SubmitDriversLincenseSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.w),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(28, 0, 0, 31),
                    blurRadius: 25.0,
                    spreadRadius: 200,
                  ),
                ],
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 22,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Text(
                        "SUBMIT DRIVER'S LICENSE",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  constraintContainer(
                      icon: Icon(
                        Icons.file_copy_sharp,
                        size: 23.w,
                        color: AppColors.white,
                      ),
                      text: "Fill Details",
                      constraints: constraints.maxWidth * .1,
                      dividerColor: AppColors.yellowThick1,
                      borderColor: AppColors.yellowThick1,
                      colorContainer: AppColors.yellowThick1),
                  constraintContainer(
                      icon: Icon(
                        Icons.file_upload,
                        size: 23.w,
                        color: AppColors.yellowThick1,
                      ),
                      text: "Upload\nLincense",
                      colorContainer: AppColors.white,
                      constraints: constraints.maxWidth * .1,
                      borderColor: AppColors.yellowThick1,
                      dividerColor: AppColors.yellowThick1),
                  constraintContainer(
                    colorContainer: AppColors.white,
                    isStep: true,
                    borderColor: AppColors.grey2,
                    icon: Icon(
                      Icons.cloud_done,
                      size: 23.w,
                      color: AppColors.grey2,
                    ),
                    text: "Complete",
                  )
                ],
              );
            }),
            SizedBox(
              height: 30.sp,
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: AppColors.white,
              colorText: AppColors.black1,
              buttonText: 'Vehicle Certificate',
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: AppColors.white,
              colorText: AppColors.black1,
              buttonText: 'Road Worthiness Certificate',
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: AppColors.white,
              colorText: AppColors.black1,
              buttonText: 'Vehicle Insurance',
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: AppColors.white,
              colorText: AppColors.black1,
              buttonText: 'Driver\'s License',
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: AppColors.white,
              colorText: AppColors.black,
              buttonText: 'Driver\'s Photograph',
            ),
            SizedBox(
              height: 65.sp,
            ),
            ButtonWidget(
              onTap: () {},
              isIcon: true,
              color: Colors.black,
              colorText: Colors.white,
              buttonText: 'Submit',
            ),
          ],
        ),
      )),
    );
  }

  constraintContainer(
          {Widget? icon,
          String? text,
          Color? colorContainer,
          Color? dividerColor,
          Color? borderColor,
          bool? isStep = false,
          dynamic constraints}) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorContainer,
                      border: Border.all(color: borderColor!, width: 2)),
                  child: icon),
              SizedBox(
                height: 5.h,
              ),
              Text(text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.grey1,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600))
            ],
          ),
          isStep == false
              ? Container(
                  margin: EdgeInsets.only(bottom: 18.w),
                  width: constraints,
                  child: Divider(
                    thickness: 2,
                    color: dividerColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
}
