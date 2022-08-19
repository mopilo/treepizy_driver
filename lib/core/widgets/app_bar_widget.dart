import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';


class AppBarWidget extends StatelessWidget{
  final String? text;
  final Function onClicked;
  const AppBarWidget({Key? key, this.text, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          IconButton(
              onPressed: (){
                onClicked();
              },
              icon: const Icon(Icons.west_outlined, size: 20)
          ),
          TextWidget(
            text: text!.toUpperCase(),
            size: 14.sp,
            weight: FontWeight.bold,
          )
        ]
    );
  }

}
