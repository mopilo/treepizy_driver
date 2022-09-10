import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import 'package:treepizy_driver/core/utils/themes.dart';
import 'package:treepizy_driver/core/widgets/bottom_sheet.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:treepizy_driver/features/utils/color.dart';
import 'package:treepizy_driver/features/vehicle_management/screen/pages/vehicle_setting_screen.dart';
import 'package:treepizy_driver/features/vehicle_management/screen/vehicle_verification_folder/vehicle_verification_pending.dart';

import 'document_management.dart';

class DocumentStepper extends StatefulWidget {
  final String? id;
  const DocumentStepper({this.id, Key? key}) : super(key: key);
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<DocumentStepper> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  File? _id;

  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(inject());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.w),
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
                    size: 22,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      "SUBMIT DRIVER'S LICENSE",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                constraintContainer(
                    icon: Icon(
                      Icons.file_copy_sharp,
                      size: 23.w,
                      color: AppColors.white,
                    ),
                    text: "Fill Details",
                    constraints: constraints.maxWidth * .1,
                    dividerColor: CustomColors.yellowThick1,
                    borderColor: CustomColors.yellowThick1,
                    colorContainer: CustomColors.yellowThick1),
                constraintContainer(
                    icon: Icon(
                      Icons.file_upload,
                      size: 23.w,
                      color: CustomColors.yellowThick1,
                    ),
                    text: "Upload\nLincense",
                    colorContainer: Colors.white,
                    constraints: constraints.maxWidth * .1,
                    borderColor: CustomColors.yellowThick1,
                    dividerColor: CustomColors.yellowThick1),
                constraintContainer(
                  colorContainer: AppColors.white,
                  isStep: true,
                  borderColor: AppColors.grey2,
                  icon: Icon(
                    Icons.cloud_done,
                    size: 23.w,
                    color: AppColors.grey2,
                  ),
                  text: "Complete",
                )
              ],
            );
          }),
          SizedBox(
            height: 30.sp,
          ),
          _currentStep == 0
              ? DocumentScreen(func: () {
                  continued();
                })
              : _currentStep == 1
                  ? BlocProvider<AuthBloc>(
                      create: (context) => _authBloc!,
                      child: BlocConsumer<AuthBloc, AuthState>(
                          listener: (BuildContext context, state) {
                        if (state is UserAvatarModified) {
                          continued();
                        }
                      }, builder: (BuildContext context, state) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              const Text('Upload License',
                                  style: TextStyle(fontSize: 10)),
                              const TextWidget(
                                text: "Upload Certificate",
                                size: 24,
                              ),
                              const TextWidget(
                                text:
                                    "Upload the front page of your Vehicle Certificate",
                                size: 14,
                                height: 1.4,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 40),
                                child: GestureDetector(
                                  onTap: () => showSheet(
                                    context,
                                    action: (File? file) {
                                      setState(() {
                                        _id = file;
                                      });
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                  child: _id != null
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: Image.file(
                                            _id!,
                                            width: 337,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Image.asset("assets/doc.png"),
                                ),
                              ),
                              ButtonWidget(
                                onTap: () {
                                  _authBloc?.add(
                                      UploadEvent(file: _id, id: widget.id!));
                                },
                                buttonText: state is Loading
                                    ? "Uploading..."
                                    : 'Upload Image',
                                colorText: AppColors.white,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        );
                      }))
                  : VehicleVerificationPending(func: () {
                      start();
                    }),

          //  SizedBox(
          //     height: 65.sp,
          //   ),
          //   ButtonWidget(
          //     onTap: () {},
          //     isIcon: true,
          //     color: Colors.black,
          //     colorText: Colors.white,
          //     buttonText: 'Submit',
          //   ),
        ],
      ),
    ))

        // SafeArea(
        //   child: Container(
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: Theme(
        //             data: ThemeData(
        //             accentColor: Colors.deepOrangeAccent,
        //             primarySwatch: Colors.orange,
        //             colorScheme: ColorScheme.light(
        //               primary: Colors.deepOrangeAccent
        //             )
        //           ),
        //             child: Stepper(
        //               type: stepperType,
        //               physics: ScrollPhysics(),
        //               currentStep: _currentStep,
        //               onStepTapped: (step) => tapped(step),
        //               onStepContinue: continued,
        //               elevation: 0.0,
        //               // onStepCancel: cancel,
        //               steps: <Step>[
        //                 Step(
        //                   title: new Text('Fill Details', style: TextStyle(fontSize: 10),),
        //                   content: DocumentScreen(),
        //                   isActive: _currentStep >= 0,
        //                   state: _currentStep >= 0
        //                       ? StepState.complete
        //                       : StepState.disabled,
        //                 ),
        //                 Step(

        //                 Step(
        //                   title: new Text('Complete', style: TextStyle(fontSize: 10)),
        //                   content: Column(
        //                     children: <Widget>[
        //                       TextFormField(
        //                         decoration:
        //                             InputDecoration(labelText: 'Mobile Number'),
        //                       ),
        //                     ],
        //                   ),
        //                   isActive: _currentStep >= 0,
        //                   state: _currentStep >= 2
        //                       ? StepState.complete
        //                       : StepState.disabled,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  start() {
    setState(() => _currentStep = 0);
  }

  constraintContainer(
          {Widget? icon,
          String? text,
          Color? colorContainer,
          Color? dividerColor,
          Color? borderColor,
          bool? isStep = false,
          dynamic constraints}) =>
      GestureDetector(
        onTap: () {
          cancel();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorContainer,
                        border: Border.all(color: borderColor!, width: 2)),
                    child: icon),
                SizedBox(
                  height: 5.h,
                ),
                Text(text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.grey1,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600))
              ],
            ),
            isStep == false
                ? Container(
                    margin: EdgeInsets.only(bottom: 18.w),
                    width: constraints,
                    child: Divider(
                      thickness: 2,
                      color: dividerColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
}
