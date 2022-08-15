import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'vehicle_verification_approved.dart';


class VehicleVerificationPending extends StatelessWidget {
  const VehicleVerificationPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        "VEHICLE VERIFICATION",
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
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/pending.png',
              height: 250,
              width: 220,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "PENDING",
              style: TextStyle(
                  color: AppColors.yellowThick,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We'll review your\nrequest",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "While reviewing your vehicle we might contact you for physical vehicle inspection as part of the verification process",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                color: AppColors.green,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greenLight,
                    blurRadius: 25.0,
                    spreadRadius: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VehicleVerificationApproved())),
              isIcon: true,
              buttonText: 'Vehicle Details',
              colorText: AppColors.white,
              fontSize: 15.5,
              iconColor: AppColors.white,
              fontWeight: FontWeight.w600,
              color: AppColors.black1,
            ),
          ],
        ),
      )),
    );
  }
}
