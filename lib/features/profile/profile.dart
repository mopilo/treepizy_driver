import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';

import '../../core/widgets/app_bar_widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.00000,
          bottomOpacity: 0.0,
          shadowColor: Colors.black54,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFFE8E8E8),
                          blurRadius: 200.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: AppBarWidget(
                      text: "PROFILE",
                      onClicked: () {
                        Navigator.pop(context);
                      }),
                  // Row(
                  //   children: [
                  //     const Icon(Icons.arrow_back),
                  //     SizedBox(width: 8.w),
                  //     TextWidget(
                  //       text: "PROFILE",
                  //       size: 14.sp,
                  //       weight: FontWeight.bold,
                  //     )
                  //   ],
                  // ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFFE8E8E8),
                          blurRadius: 300.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 65.r,
                    backgroundColor: Colors.black12,
                  ),
                ),
                SizedBox(height: 47.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "First name",
                            size: 14.sp,
                          ),
                          TextWidget(
                              text: "",
                              size: 14.sp,
                              weight: FontWeight.bold)
                        ],
                      ),
                      SizedBox(width: 80.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Last name",
                            size: 14.sp,
                          ),
                          TextWidget(
                              text: "",
                              size: 14.sp,
                              weight: FontWeight.bold)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Phone number",
                            size: 14.sp,
                          ),
                          TextWidget(
                              text: "",
                              size: 14.sp,
                              weight: FontWeight.bold)
                        ],
                      ),
                      TextWidget(
                        text: "verified",
                        size: 12.sp,
                        appcolor: Colors.green,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Email",
                            size: 14.sp,
                          ),
                          TextWidget(
                              text: "",
                              size: 14.sp,
                              weight: FontWeight.bold)
                        ],
                      ),
                      TextWidget(
                        text: "verified",
                        size: 12.sp,
                        appcolor: Colors.green,
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 19.w),
                    width: double.infinity,
                    height: 45.h,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextWidget(
                            text: "Edit Profile",
                            size: 12.sp,
                            appcolor: Colors.white
                          ),
                        ),
                        onPressed: () {
                          
                        })),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 19.w, vertical: 20),
                    width: double.infinity,
                    height: 45.h,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextWidget(
                            text: "Manage Notifications",
                            size: 12.sp,
                            appcolor: Colors.black,
                          ),
                        ),
                        onPressed: () {})),
              ],
            ),
          ));
  }
}
