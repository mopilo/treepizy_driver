import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/card_button_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/provider/vehicle_provider.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'vehicle_managament2.dart';

class VehicleManagement extends StatefulWidget {
  const VehicleManagement({Key? key}) : super(key: key);

  @override
  State<VehicleManagement> createState() => _VehicleManagementState();
}

class _VehicleManagementState extends State<VehicleManagement> {
  @override
  void initState() {
    Provider.of<VehicleProvider>(context, listen: false).getVehicle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Consumer<VehicleProvider>(
          builder: (_, provider, __) {
            if (provider.responses == null) {
              return Padding(
                padding: EdgeInsets.only(top:28.w),
                child: Center(
                  child: SpinKitCubeGrid(
                    color: AppColors.darkGrey,
                    size: 30.0.sp,
                  ),
                ),
              );
            }
            if (provider.responses?['hydra:member'].isEmpty) {
              return Text(
                'No Vehicle',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              );
            }
            return Column(
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
                        SizedBox(
                          width: 10.w,
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
                SizedBox(height: 55.h),
                ...provider.responses['hydra:member']
                    .map(
                      (data) => CardButtonWidget(
                          containerText: 'Verified',
                          containerColorText: AppColors.green,
                          containerColor: AppColors.greenLight,
                          image: 'assets/red_toyota.png',
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VehicleManagementSecondScreen())),
                          isIcon: true,
                          iconColor: AppColors.grey2,
                          buttonText2: data['name'],
                          color: Colors.white,
                          colorText: AppColors.black,
                          buttonText: 'ABC 654 BY'),
                    )
                    .toList(),
                // CardButtonWidget(
                //     containerText: 'Verified',
                //     containerColorText: AppColors.green,
                //     containerColor: AppColors.greenLight,
                //     image: 'assets/red_toyota.png',
                //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) =>
                //             const VehicleManagementSecondScreen())),
                //     isIcon: true,
                //     iconColor: AppColors.grey2,
                //     buttonText2: 'Toyota Corolla',
                //     color: Colors.white,
                //     colorText: AppColors.black,
                //     buttonText: 'ABC 654 BY'),
                // const SizedBox(height: 15),
                // CardButtonWidget(
                //     containerText: 'Pending',
                //     containerColorText: AppColors.yellow,
                //     containerColor: AppColors.yellowLight,
                //     image: 'assets/honda.png',
                //     onTap: () => Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) => Container())),
                //     isIcon: true,
                //     iconColor: AppColors.grey2,
                //     buttonText2: 'Honda Civic',
                //     color: Colors.white,
                //     colorText: AppColors.black,
                //     buttonText: 'ABC 147 CK'),
                SizedBox(height: 55.h),
                ButtonWidget(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const VehicleManagementSecondScreen())),
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
                      builder: (context) =>
                          const VehicleManagementSecondScreen())),
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
            );
          },
        ),
      )),
    );
  }
}
