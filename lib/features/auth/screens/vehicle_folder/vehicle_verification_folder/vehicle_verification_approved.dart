import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/auth/screens/vehicle_folder/vehicle_verification_folder/vehicle_verification_disapproved.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../utils/color.dart';

class VehicleVerificationApproved extends StatelessWidget {
  const VehicleVerificationApproved({Key? key}) : super(key: key);

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
              'assets/approved.png',
              height: 250,
              width: 220,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "APPROVED",
              style: TextStyle(
                  color: AppColors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You're all set!!!",
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
              "Thank you or your patience, your vehicle\n has been approved, you can now start\n taking trips",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
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
              height: 45,
            ),
            ButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const VehicleVerificationDisapproved())),
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
