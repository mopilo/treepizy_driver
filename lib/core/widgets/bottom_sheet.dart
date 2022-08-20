import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepizy_driver/features/utils/helper.dart';

import 'text_widget.dart';

showSheet(BuildContext context,
        {@required Widget? child, required Function(File? file)? action}) =>
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () async {
                final _file =
                    await Helpers.processImage(context, ImageSource.camera);
                action!(_file);
              },
              child: TextWidget(
                text: "Take photo",
                size: 16.sp,
                weight: FontWeight.w400,
                appcolor: Colors.blue,
                align: TextAlign.center,
              )),
              CupertinoActionSheetAction(
              onPressed: () async {
                final _file =
                    await Helpers.processImage(context, ImageSource.gallery);
                action!(_file);
              },
              child: TextWidget(
                text: "Choose photo",
                size: 16.sp,
                weight: FontWeight.w400,
                appcolor: Colors.blue,
                align: TextAlign.center,
              )),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: TextWidget(
            text: "Cancel",
            size: 16.sp,
            weight: FontWeight.w400,
            appcolor: const Color(0xff007AFF),
            align: TextAlign.center,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: false).pop();
          },
        ),
      ),
    );
