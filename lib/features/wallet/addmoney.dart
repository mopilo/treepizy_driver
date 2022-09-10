import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/features/utils/color.dart';
import 'package:treepizy_driver/features/wallet/withdrawal.dart';

import '../../core/widgets/button_widget.dart';
import '../../core/widgets/text_form_field.dart';

class AddMoney extends StatelessWidget {
  AddMoney({super.key});

  TextEditingController amountController = TextEditingController();
  TextEditingController fundingSourceController = TextEditingController();

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
                        "ADD MONEY",
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
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
              controller: fundingSourceController,
              readOnly: false,
              label: 'Funding Source',
              obscureText: false,
              suffixIcon: Icons.arrow_drop_down,
            ),
            SizedBox(height: 60.h),
            ButtonWidget(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WithdrawMoney())),
              isIcon: false,
              isJustText: true,
              color: Colors.black,
              colorText: Colors.white,
              buttonText: 'Add Money',
            ),
          ],
        ),
      )),
    );
  }
}
