// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/card_button_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';
import 'package:treepizy_driver/features/vehicle_management/screen/provider/vehicle_provider.dart';

import 'add_vehicle.dart';

class VehicleManagementSecondScreen extends StatefulWidget {
  const VehicleManagementSecondScreen({Key? key}) : super(key: key);

  @override
  State<VehicleManagementSecondScreen> createState() =>
      _VehicleManagementSecondScreenState();
}

class _VehicleManagementSecondScreenState
    extends State<VehicleManagementSecondScreen> {
  String image(String? name) {
    switch (name) {
      case 'Car':
        return 'assets/red_toyota.png';
      case 'Trike':
        return 'assets/red_toyota.png';
      case 'Van':
        return 'assets/van.png';
      case 'Bike':
        return 'assets/bike.png';
      case 'Truck':
        return 'assets/red_and_wite.png';
      default:
        return 'assets/red_and_wite.png';
    }
  }

  @override
  void initState() {
    Provider.of<VehicleProvider>(context, listen: false).getVehicleCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<VehicleProvider>(
        builder: (_, provider, __) {
          if (provider.vehicleCategory == null) {
            return Padding(
              padding: EdgeInsets.only(top: 28.w),
              child: Center(
                child: SpinKitCubeGrid(
                  color: AppColors.darkGrey,
                  size: 30.0.sp,
                ),
              ),
            );
          }
          if (provider.vehicleCategory!.hydraMember!.isEmpty) {
            return Text(
              'No Vehicle Category',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            );
          }
          return SingleChildScrollView(
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
                  const SizedBox(
                    height: 75,
                  ),
                  ...provider.vehicleCategory!.hydraMember!.map((data) {
                    return CardButtonWidget(
                        containerText: '',
                        containerColorText: AppColors.green,
                        containerColor: AppColors.greenLight,
                        image: image(data.name),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddVehicleScreen(category: data)));
                        },
                        isIcon: true,
                        iconColor: AppColors.grey2,
                        buttonText2: '',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        colorText: AppColors.black,
                        buttonText: data.name);
                  }).toList(),
                  // CardButtonWidget(
                  //     containerText: '',
                  //     containerColorText: AppColors.green,
                  //     containerColor: AppColors.greenLight,
                  //     image: 'assets/bike.png',
                  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) =>
                  //             const VehicleManagementSecondScreen())),
                  //     isIcon: true,
                  //     iconColor: AppColors.grey2,
                  //     buttonText2: '',
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     colorText: AppColors.black,
                  //     buttonText: 'Bike'),
                  // const SizedBox(height: 15),
                  // CardButtonWidget(
                  //     containerText: '',
                  //     containerColorText: AppColors.green,
                  //     containerColor: AppColors.greenLight,
                  //     image: 'assets/red_toyota.png',
                  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) =>
                  //             const VehicleManagementSecondScreen())),
                  //     isIcon: true,
                  //     iconColor: AppColors.grey2,
                  //     buttonText2: '',
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     colorText: AppColors.black,
                  //     buttonText: 'Car'),
                  // const SizedBox(height: 15),
                  // CardButtonWidget(
                  //     containerText: '',
                  //     containerColorText: AppColors.green,
                  //     containerColor: AppColors.greenLight,
                  //     image: 'assets/van.png',
                  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) =>
                  //             const VehicleManagementSecondScreen())),
                  //     isIcon: true,
                  //     iconColor: AppColors.grey2,
                  //     fontWeight: FontWeight.bold,
                  //     buttonText2: '',
                  //     color: Colors.white,
                  //     colorText: AppColors.black,
                  //     buttonText: 'Van'),
                  // const SizedBox(height: 15),
                  // CardButtonWidget(
                  //     containerText: '',
                  //     containerColorText: AppColors.green,
                  //     containerColor: AppColors.greenLight,
                  //     image: 'assets/red_and_wite.png',
                  //     fontWeight: FontWeight.bold,
                  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) =>
                  //             const VehicleManagementSecondScreen())),
                  //     isIcon: true,
                  //     iconColor: AppColors.grey2,
                  //     buttonText2: '',
                  //     color: Colors.white,
                  //     colorText: AppColors.black,
                  //     buttonText: 'Truck'),
                  const SizedBox(height: 95),
                  ButtonWidget(
                    onTap: () {},
                    isIcon: true,
                    buttonText: 'Enter Vehicle Details',
                    colorText: AppColors.white,
                    fontSize: 15.5,
                    iconColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1,
                  ),
                ],
              ));
        },
      )),
    );
  }
}
