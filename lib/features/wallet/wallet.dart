import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/features/wallet/addmoney.dart';
import '../../core/widgets/button_widget.dart';
import '../utils/color.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
                      "WALLET",
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              // height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total Earnings',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '₦137,554.75',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.w),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.grey),
                            child: Icon(
                              Icons.arrow_downward,
                              size: 27.sp,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Add Money',
                            style: TextStyle(
                                fontSize: 13.sp, color: AppColors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.w),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.green),
                            child: Icon(
                              Icons.arrow_upward,
                              size: 27.sp,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                                fontSize: 13.sp, color: AppColors.green),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.w),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellowThick1),
                            child: Icon(
                              Icons.arrow_downward,
                              size: 27.sp,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Transfer',
                            style: TextStyle(
                                fontSize: 13.sp, color: AppColors.yellowThick1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LATEST TRANSACTION',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey),
              ),
              Text(
                'VIEW ALL',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: AppColors.grey1,
            thickness: .5.sp,
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3:32 PM',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      '13 JUL 21',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Withdraw to Mastercard',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'John Doe - Mastercard **** 8789',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '- ₦50,000',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Withdrawal',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.grey1,
                      thickness: 1.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          ButtonWidget(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  AddMoney())),
            isIcon: false,
            isJustText: true,
            color: Colors.black,
            colorText: Colors.white,
            buttonText: 'Log Out',
          ),
        ]),
      )),
    );
  }
}
