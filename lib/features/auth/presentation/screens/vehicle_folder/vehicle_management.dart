import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/card_button_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'vehicle_managament2.dart';



class VehicleManagement extends StatelessWidget {
  const VehicleManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                      size: 21,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Vehicle Management".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 215),
            CardButtonWidget(
                containerText: 'Verified',
                containerColorText: AppColors.green,
                containerColor: AppColors.greenLight,
                image: 'assets/red_toyota.png',
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const VehicleManagementSecondScreen())),
                isIcon: true,
                iconColor: AppColors.grey2,
                buttonText2: 'Toyota Corolla',
                color: Colors.white,
                colorText: AppColors.black,
                buttonText: 'ABC 654 BY'),
            const SizedBox(height: 15),
            CardButtonWidget(
                containerText: 'Pending',
                containerColorText: AppColors.yellow,
                containerColor: AppColors.yellowLight,
                image: 'assets/honda.png',
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Container())),
                isIcon: true,
                iconColor: AppColors.grey2,
                buttonText2: 'Honda Civic',
                color: Colors.white,
                colorText: AppColors.black,
                buttonText: 'ABC 147 CK'),
            const SizedBox(height: 85),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VehicleManagementSecondScreen())),
              isIcon: true,
              buttonText: 'Add A Vehicle',
              colorText: AppColors.white,
              fontSize: 15.5,
              iconColor: AppColors.white,
              fontWeight: FontWeight.w600,
              color: AppColors.black1,
            ),
            const SizedBox(height: 15),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VehicleManagementSecondScreen())),
              isIcon: true,
              buttonText: 'Remove Vehicle',
              colorText: AppColors.red,
              fontSize: 15.5,
              colorBorder: AppColors.red,
              iconColor: AppColors.red,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.grey1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 4,
              width: 140,
            )
          ],
        ),
      )),
    );
  }
}
