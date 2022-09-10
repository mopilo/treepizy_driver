import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/button_widget.dart';
import '../../core/widgets/text_form_field.dart';
import '../utils/color.dart';
import 'addmoney.dart';
import 'new_account.dart';

class WithdrawMoney extends StatelessWidget {
  WithdrawMoney({super.key});

  TextEditingController amountController = TextEditingController();
  TextEditingController withdrawalController = TextEditingController();
  TextEditingController commentController = TextEditingController();

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
                      "WITHDRAW",
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
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Wallet Value',
                    style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '₦137,554.75',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          EditTextForm(
            controller: amountController,
            readOnly: false,
            label: 'Amount',
            obscureText: false,
          ),
          SizedBox(
            height: 30.h,
          ),
          EditTextForm(
            controller: withdrawalController,
            readOnly: false,
            label: 'Withdraw to',
            obscureText: false,
            suffixIcon: Icons.arrow_drop_down,
          ),
          SizedBox(
            height: 30.h,
          ),
          EditTextForm(
            isComment: true,
            controller: commentController,
            readOnly: false,
            label: 'Comment',
            obscureText: false,
          ),
          SizedBox(height: 60.h),
          ButtonWidget(
            onTap: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Transfer 50,000 to GTBank ***776',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10.h),
                        Divider(
                          color: AppColors.grey1,
                          thickness: 1.sp,
                        ),
                        SizedBox(height: 10.h),
                        ButtonWidget(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => NewAccountScreen())),
                          isIcon: false,
                          isJustText: true,
                          color: AppColors.green,
                          colorText: Colors.white,
                          buttonText: 'Yes, Transfer',
                          border: 40,
                        ),
                        SizedBox(height: 10.h),
                        ButtonWidget(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => WithdrawMoney())),
                          isIcon: false,
                          isJustText: true,
                          color: Colors.transparent,
                          colorText: AppColors.grey1,
                          buttonText: 'Cancel',
                          border: 40,
                          colorBorder: AppColors.grey1,
                        ),
                      ],
                    ),
                  );
                }),
            isIcon: false,
            isJustText: true,
            color: Colors.black,
            colorText: Colors.white,
            buttonText: 'Withdraw',
          ),
        ],
      ),
    )));
  }
}
