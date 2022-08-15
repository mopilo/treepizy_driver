import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/color.dart';

class EditFormField extends StatelessWidget {
  EditFormField(
      {Key? key,
      this.textCapitalization,
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
      this.obscureText,
      this.readOnly,
      this.isMuchDec,
      this.onTapped,
      this.keyboardType,
      this.suffixIconColor,
      this.prefixIconColor,
      this.formKey})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 9, 9, 9),
          focusColor: Colors.grey,
          contentPadding: const EdgeInsets.fromLTRB(25.0, 20.0, 20.0, 20.0),
          labelStyle: const TextStyle(color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 0.5, color: AppColors.grey),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 0.5, color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 0.5, color: AppColors.grey),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 0.5, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 0.5, color: Colors.redAccent)),
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
      cursorColor: AppColors.black,
    );
  }
}
