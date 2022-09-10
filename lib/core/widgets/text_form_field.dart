import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/features/utils/color.dart';

class EditTextForm extends StatelessWidget {
  EditTextForm({
    Key? key,
    this.textCapitalization,
    this.inputFormatters,
    this.label,
    this.floatingLabel,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.validator,
    this.onPasswordToggle,
    this.initialValue,
    this.controller,
    this.autoValidateMode,
    this.obscureText = false,
    this.readOnly = false,
    this.isComment = false,
    this.onTapped,
    this.isMuchDec = false,
    this.isRoundTextField = false,
    this.keyboardType,
    this.suffixIconColor,
    this.prefixIconColor,
    this.formKey,
  }) : super(key: key);

  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;

  final String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isMuchDec;
  final Function()? onTapped;

  final TextInputType? keyboardType;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Key? formKey;
  final bool? isRoundTextField;
  final bool? isComment;

  @override
  Widget build(BuildContext context) {
    return isRoundTextField!
        ? TextFormField(
            validator: validator,
            obscureText: obscureText!,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                labelStyle: const TextStyle(color: Colors.grey),
                label: Text(label ?? ''),

                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(0.0),
                //   borderSide: const BorderSide(color: Colors.black),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(0)),
                //   borderSide: BorderSide(width: 0.5, color: AppColors.primary),
                // ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                // enabledBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(0)),
                //   borderSide: BorderSide(width: 0.5, color: AppColors.primary),
                // ),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(width: 0.5, color: Colors.red)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.redAccent)),
                prefixIcon: prefixWidget ??
                    (prefixIcon != null
                        ? IconButton(
                            onPressed: onPasswordToggle,
                            icon: Icon(
                              prefixIcon,
                              color: prefixIconColor,
                            ))
                        : null),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: suffixWidget ??
                      (suffixIcon != null
                          ? IconButton(
                              onPressed: onPasswordToggle,
                              icon: Icon(
                                suffixIcon,
                                color: suffixIconColor,
                              ))
                          : null),
                )),
            controller: controller,
            readOnly: readOnly!,
            onTap: onTapped,
            key: formKey,
            cursorColor: Colors.black,
          )
        : TextFormField(
            cursorColor: AppColors.black1,
            textAlign: TextAlign.start,
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: !isComment!
                    ? const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0)
                    : EdgeInsets.fromLTRB(10.w, 0.w, 10.w, 80.w),
                labelStyle: const TextStyle(color: Colors.grey),
                label: Text(label ?? ''),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: AppColors.grey1),
                ),
                filled: true,
                fillColor: Colors.transparent,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: suffixWidget ??
                      (suffixIcon != null
                          ? IconButton(
                              onPressed: onPasswordToggle,
                              icon: Icon(
                                suffixIcon,
                                color: suffixIconColor,
                              ))
                          : null),
                )),
          );
  }
}
