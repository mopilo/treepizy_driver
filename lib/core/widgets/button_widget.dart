import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.elevation,
    this.color,
    this.colorText,
    this.buttonText,
    this.fontSize = 14,
    this.isIcon = false,
    required this.onTap,
  }) : super(key: key);
  final double? elevation;
  final double? fontSize;
  final Color? color;
  final Color? colorText;
  final String? buttonText;
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
            padding: EdgeInsets.symmetric(
                horizontal: 30.0, vertical: isIcon! ? 14.8 : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonText ?? "",
                  style: TextStyle(
                      color: colorText,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500),
                ),
                isIcon!
                    ? Icon(
                        Icons.arrow_forward,
                        color: colorText,
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
