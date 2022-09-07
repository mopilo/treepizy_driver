import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'document_stepper.dart';

class DocumentScreen extends StatelessWidget {
  final func;
  const DocumentScreen({Key? key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 14),
      child: Column(
        children: [
          const SizedBox(height: 95),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonWidget(
                onTap: () {
                  func();
                },
                isIcon: true,
                buttonText: 'Vehicle Certificate',
                colorText: AppColors.black,
                fontSize: 15.5,
                iconColor: AppColors.grey1,
                fontWeight: FontWeight.w600,
                color: const Color(0XFFDADEE3),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) =>  DocumentStepper()));
                },
                isIcon: true,
                buttonText: 'Road Worthiness Certificate',
                colorText: AppColors.black,
                fontSize: 15.5,
                iconColor: AppColors.grey1,
                fontWeight: FontWeight.w600,
                color: const Color(0XFFDADEE3),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                onTap: () {},
                isIcon: true,
                buttonText: 'Vehicle Insurance',
                colorText: AppColors.black,
                fontSize: 15.5,
                iconColor: AppColors.grey1,
                fontWeight: FontWeight.w600,
                color: const Color(0XFFDADEE3),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                onTap: () {},
                isIcon: true,
                buttonText: 'Drivers Licence',
                colorText: AppColors.black,
                iconColor: AppColors.grey1,
                fontSize: 15.5,
                fontWeight: FontWeight.w600,
                color: const Color(0XFFDADEE3),
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
