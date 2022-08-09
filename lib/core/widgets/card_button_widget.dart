import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/utils/color.dart';

class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({
    Key? key,
    this.elevation,
    this.color,
    this.colorText,
    this.image,
    this.fontWeight,
    this.buttonText,
    this.buttonText1,
    this.containerColorText,
    this.containerText,
    this.buttonText2,
    this.containerColor,
    this.iconColor,
    this.fontSize = 14,
    this.isIcon = false,
    required this.onTap,
  }) : super(key: key);
  final double? elevation;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? containerColorText;
  final Color? colorText;
  final Color? containerColor;
  final Color? iconColor;
  final String? buttonText;
  final String? containerText;
  final String? buttonText1;
  final String? buttonText2;
  final String? image;
  final bool? isIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 27.0, top: 13, bottom: 13, right: 10),
            child: Row(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.grey2,
                    ),
                  ),
                  Positioned(
                    bottom: -6.5,
                    left: -12.8,
                    child: Image.asset(
                      image ?? '',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ]),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buttonText ?? "",
                      style: TextStyle(
                          color: colorText,
                          fontSize: fontSize,
                          fontWeight: fontWeight ?? FontWeight.w500),
                    ),
                    buttonText2 == ''
                        ? const SizedBox.shrink()
                        : Text(
                            buttonText2 ?? "",
                            style: TextStyle(
                                color: colorText,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                containerText == ''
                    ? const SizedBox.shrink()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4.5),
                        decoration: BoxDecoration(
                          color: containerColor!,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          containerText!,
                          style: TextStyle(
                              color: containerColorText,
                              fontSize: 11,
                              fontWeight: fontWeight ?? FontWeight.w500),
                        ),
                      ),
                const Spacer(),
                isIcon!
                    ? Icon(
                        Icons.arrow_forward,
                        color: iconColor ?? colorText,
                        size: 30,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
