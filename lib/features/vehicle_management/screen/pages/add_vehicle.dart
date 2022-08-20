import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/features/document_upload/document_management.dart';
import 'package:treepizy_driver/features/utils/color.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_category_model.dart';
import 'package:treepizy_driver/features/vehicle_management/screen/provider/vehicle_provider.dart';

import '../../data/model/vehicle_make_model.dart';

class AddVehicleScreen extends StatefulWidget {
  final HydraMember category;
  AddVehicleScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final TextEditingController _engineNumberController = TextEditingController();
  final TextEditingController _regNumberController = TextEditingController();

  String dropdownValue = 'Dog';
  String color = 'Blue';
  String yr = '2021';
  HydraMemberMake? model;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var colors = ['Blue', 'Yellow'];

  var year = ['2022', '2020', "2021"];
  VehicleProvider? _vehicleProvider;
  @override
  void initState() {
    _vehicleProvider = Provider.of<VehicleProvider>(context, listen: false);
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
                padding: EdgeInsets.only(top: 28.w),
                child: Center(
                  child: SpinKitCubeGrid(
                    color: AppColors.darkGrey,
                    size: 30.0.sp,
                  ),
                ),
              );
            }
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
                    vehicleText: 'Vehicle Engine Number',
                    vehicleInfo: '',
                    controller: _engineNumberController),
                const SizedBox(
                  height: 10,
                ),
                // vehicleInfoContainer(
                //   vehicleText: 'Vehicle Model',
                //   vehicleInfo: 'Toyota',
                // ),
                vehicleInfoContainer(
                  vehicleText: 'Model',
                  vehicleInfo: 'Corolla',
                  isShow: true,
                  arType: "model",
                ),
                vehicleInfoContainer(
                    vehicleText: 'Year',
                    vehicleInfo: '2011',
                    isShow: true,
                    ar: year,
                    va: yr),
                vehicleInfoContainer(
                    vehicleText: 'Color',
                    vehicleInfo: 'Blue',
                    isShow: true,
                    ar: colors,
                    va: color),
                vehicleInfoContainer(
                    vehicleText: 'Registration Number',
                    vehicleInfo: 'ABC 654 BY',
                    controller: _regNumberController),
                const SizedBox(
                  height: 70,
                ),
                ButtonWidget(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DocumentScreen()));
                  },
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

  Widget vehicleInfoContainer(
      {String? vehicleText,
      String? vehicleInfo,
      bool? isShow = false,
      Function()? function,
      List<String>? ar,
      String? arType,
      controller,
      String? va}) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.only(bottom: 17),
      padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: isShow == true ? 5 : 15,
          bottom: isShow == true ? 0 : 12),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10)),
      child:
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vehicleText!,
              style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            // const SizedBox(
            //   height: 3,
            // ),
            // Text(
            //   vehicleInfo!,
            //   style: const TextStyle(
            //       color: Colors.black,
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600),
            // ),
            !isShow!
                ? TextField(
                    controller: controller,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                  )
                : arType != null
                    ? DropdownButton<HydraMemberMake>(
                        // Step 3.
                        isExpanded: true,
                        underline: const SizedBox.shrink(),

                        value: model,
                        // Step 4.
                        items: _vehicleProvider?.responses?.hydraMember
                            ?.map<DropdownMenuItem<HydraMemberMake>>(
                                (HydraMemberMake value) {
                          return DropdownMenuItem<HydraMemberMake>(
                            value: value,
                            child: Text(
                              value.name!,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (newValue) {
                          print(newValue);
                          setState(() {
                            model = newValue;
                          });
                        },
                      )
                    : DropdownButton<String>(
                        isExpanded: true,
                        underline: const SizedBox.shrink(),

                        value: va,
                        items:
                            ar?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          print(newValue);
                          setState(() {
                            va == yr ? yr = newValue! : color = newValue!;
                          });
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
