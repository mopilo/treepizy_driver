import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/features/submit_driver_lincense_folder/submit_drivers_lincense_second_screen.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import '../../core/widgets/button_widget.dart';

class SubmitDriversLincenceFirstScreen extends StatefulWidget {
  const SubmitDriversLincenceFirstScreen({Key? key}) : super(key: key);

  @override
  State<SubmitDriversLincenceFirstScreen> createState() =>
      _SubmitDriversLincenceFirstScreenState();
}

class _SubmitDriversLincenceFirstScreenState
    extends State<SubmitDriversLincenceFirstScreen> {
  int index = 0;

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
                      dividerColor: AppColors.grey1,
                      borderColor: AppColors.yellowThick1,
                      colorContainer: AppColors.yellowThick1),
                  constraintContainer(
                      icon: Icon(
                        Icons.file_upload,
                        size: 23.w,
                        color: AppColors.grey1,
                      ),
                      text: "Upload\nLincense",
                      colorContainer: AppColors.white,
                      constraints: constraints.maxWidth * .1,
                      borderColor: AppColors.grey2,
                      dividerColor: AppColors.grey1),
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
            bodyContainer(text1: "L/NO", text2: "0989756231615582"),
            bodyContainer(text1: "Class", text2: "B"),
            bodyContainer(text1: "Date of Issue", text2: "10-05-2019"),
            bodyContainer(text1: "Date of Expiry", text2: "10-05-2023"),
            SizedBox(
              height: 65.sp,
            ),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const SubmitDriversLincenseSecondScreen())),
              isIcon: true,
              color: Colors.black,
              colorText: Colors.white,
              buttonText: 'Next',
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

  bodyContainer({String? text1, String? text2}) => Container(
        margin: EdgeInsets.only(bottom: 10.w),
        width: MediaQuery.of(context).size.width,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.w),
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1!,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300)),
            SizedBox(
              height: 10.h,
            ),
            Text(
              text2!,
              style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w200),
            )
          ],
        ),
      );
}
