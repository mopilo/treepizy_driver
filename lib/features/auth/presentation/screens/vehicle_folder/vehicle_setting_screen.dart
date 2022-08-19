import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'vehicle_management.dart';

class VehicleSettingsScreen extends StatelessWidget {
  const VehicleSettingsScreen({Key? key}) : super(key: key);

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
                          "BACK",
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
              const SizedBox(height: 295),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonWidget(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VehicleManagement())),
                    isIcon: true,
                    buttonText: 'Vehicle Management',
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VehicleSettingsScreen())),
                    isIcon: true,
                    buttonText: 'Document Management',
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VehicleSettingsScreen())),
                    isIcon: true,
                    buttonText: 'Preferences',
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VehicleSettingsScreen())),
                    isIcon: true,
                    buttonText: 'Notifications',
                    colorText: AppColors.black,
                    iconColor: AppColors.grey1,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFFDADEE3),
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
            ],
          ),
        ),
      ),
    );
  }
}
