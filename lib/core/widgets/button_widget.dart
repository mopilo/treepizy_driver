import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.elevation,
    this.border,
    this.color,
    this.colorText,
    this.fontWeight,
    this.buttonText,
    this.iconColor,
    this.colorBorder,
    this.fontSize = 14,
    this.isIcon = false,
    required this.onTap,
    this.isJustText = false,
  }) : super(key: key);
  final double? elevation;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? colorText;
  final Color? iconColor;
  final Color? colorBorder;
  final String? buttonText;
  final bool? isIcon;
  final Function()? onTap;
  final bool? isJustText;
  final double? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border ?? 6.0),
        ),
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: colorBorder ?? const Color(0x00000000)),
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(border ?? 10)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 30.0, vertical: isIcon! ? 14.8 : 16.4),
            child: !isJustText!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        buttonText ?? "",
                        style: TextStyle(
                            color: colorText,
                            fontSize: fontSize,
                            fontWeight: fontWeight ?? FontWeight.w500),
                      ),
                      isIcon!
                          ? Icon(
                              Icons.arrow_forward,
                              color: iconColor ?? colorText,
                              size: 30,
                            )
                          : const SizedBox.shrink()
                    ],
                  )
                : Center(
                    child: Text(
                      buttonText ?? "",
                      style: TextStyle(
                          color: colorText,
                          fontSize: fontSize,
                          fontWeight: fontWeight ?? FontWeight.w500),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
