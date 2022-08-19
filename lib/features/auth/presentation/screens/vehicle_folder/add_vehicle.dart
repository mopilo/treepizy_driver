import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/provider/vehicle_provider.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'vehicle_verification_folder/vehicle_verification_pending.dart';

class AddVehicleScreen extends StatefulWidget {
  AddVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final TextEditingController _nameController = TextEditingController();

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
            return Column(
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
                            "ADD A VEHICLE",
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
                  height: 100,
                ),
                vehicleInfoContainer(
                    vehicleText: 'Vehicle Size', vehicleInfo: '4 Seater Sedan'),
                const SizedBox(
                  height: 10,
                ),
                vehicleInfoContainer(
                    vehicleText: 'Vehicle Model', vehicleInfo: 'Toyota'),
                vehicleInfoContainer(
                    vehicleText: 'Model',
                    vehicleInfo: 'Corolla',
                    isShow: true,
                    function: () => print('rpint io i')),
                vehicleInfoContainer(vehicleText: 'Year', vehicleInfo: '2011'),
                vehicleInfoContainer(
                    vehicleText: 'Colour', vehicleInfo: 'Blue', isShow: true),
                vehicleInfoContainer(
                    vehicleText: 'Registration Number',
                    vehicleInfo: 'ABC 654 BY'),
                vehicleInfoContainer(
                    vehicleText: 'Passenger Seat', vehicleInfo: '4 Seaters'),
                const SizedBox(
                  height: 70,
                ),
                ButtonWidget(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const VehicleVerificationPending())),
                  isIcon: true,
                  buttonText: 'Submit Details',
                  colorText: AppColors.white,
                  fontSize: 15.5,
                  iconColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black1,
                ),
              ],
            );
          },
        ),
      )),
    );
  }

  vehicleInfoContainer(
          {String? vehicleText,
          String? vehicleInfo,
          bool? isShow = false,
          Function()? function}) =>
      Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleText!,
                  style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  vehicleInfo!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            isShow!
                ? GestureDetector(
                    onTap: function,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 20.sp,
                      color: AppColors.grey,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
}
