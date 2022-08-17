import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//reusable text component
class TextWidget extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double? size;
  final Function()? onTap;
  final Color? appcolor;
  final TextAlign? align;
  final double? space;
  final double? height;
  final TextOverflow? textOverflow;

  const TextWidget(
      {Key? key,
      this.onTap,
      this.text,
      this.weight,
      this.size,
      this.appcolor,
      this.align,
      this.space,
      this.textOverflow,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text!,
          style: TextStyle(
              fontWeight: weight,
              fontSize: size,
              color: appcolor,
              letterSpacing: space,
              height: height),
          overflow: textOverflow,
          textAlign: align),
    );
  }
}
