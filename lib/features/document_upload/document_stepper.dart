
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:treepizy_driver/core/widgets/bottom_sheet.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/utils/color.dart';

import 'document_management.dart';

class DocumentStepper extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<DocumentStepper> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  File? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Theme(
                  data: ThemeData(
                  accentColor: Colors.deepOrangeAccent,
                  primarySwatch: Colors.orange,
                  colorScheme: ColorScheme.light(
                    primary: Colors.deepOrangeAccent
                  )
                ),
                  child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    elevation: 0.0,
                    // onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                        title: new Text('Fill Details', style: TextStyle(fontSize: 10),),
                        content: DocumentScreen(),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Upload License', style: TextStyle(fontSize: 10)),
                        content: Column(
                          children: <Widget>[
                            
                            TextWidget(
                              text: "Upload Certificate",
                              size: 24,
                            ),
                            TextWidget(
                              text: "Upload the front page of your Vehicle Certificate",
                              size: 14,
                              height: 1.4,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 40),
                              child: GestureDetector(
                                onTap: ()=>showSheet(
                                    context,
                                    action: (File? file) {
                                      setState(() {
                                        _id = file;
                                      });
                                      Navigator.pop(context, true);
                                    },),
                                child: _id != null
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Image.file(
                                      _id!,
                                      width: 337,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ): Image.asset("assets/doc.png"),
                              ),
                            ),
                           ButtonWidget(
                              onTap: () {},
                              buttonText: 'Upload Image',
                              colorText: AppColors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color:  Colors.black,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Complete', style: TextStyle(fontSize: 10)),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Mobile Number'),
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
     
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
}
