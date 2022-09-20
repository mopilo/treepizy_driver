import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import '../../core/widgets/button_widget.dart';

class SubcriptionScreen extends StatefulWidget {
  const SubcriptionScreen({super.key});

  @override
  State<SubcriptionScreen> createState() => _SubcriptionScreenState();
}

class _SubcriptionScreenState extends State<SubcriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        child: Column(
          children: [
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
                        "SUBSCRIPTION",
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
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.w, 16.w, 8.w),
              child: Text(
                'Tap on any plan to select and the amount will be deducted from your wallet, so make sure that you have enough balance',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 45.sp,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daily Plan',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'NGN 1,000',
                          style: TextStyle(
                              color: AppColors.yellowThick,
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Unlimited Rides',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.grey1,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'One Day',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.grey1,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'You will be charged 0% per ride from your wallet for every ride',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.grey1,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ButtonWidget(
              onTap: () {},
              // onTap: () => Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const SubcriptionScreen())),
              isIcon: false,
              isJustText: true,
              color: Colors.black,
              colorText: Colors.white,
              buttonText: 'Subscribe Now',
            ),
          ],
        ),
      )),
    );
  }
}
