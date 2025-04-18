
import 'package:flutter/material.dart';

import 'package:case_of_altur_project/helper/string_util.dart';
import '../../gen/color_gen.dart';
import '../../helper/validators.dart';
import 'custom_text_form_field.dart';

class UsernameFormField extends CustomTextFormField {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final keybordType;

  UsernameFormField({
    super.key,
    super.initialValue,
    super.onSaved,
    super.hintText,
    super.labelText,
    super.hintStyle,
    super.labelTextStyle,
    super.inputFormatters,
    this.keybordType,
    required super.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    super.margin,
    String? Function(String?)? validator,
    String? incorrectEmailMessage,
    String? incorrectUsernameMessage,
  }) : super(
          textEditingController: controller,
          suffixIcon: suffixIcon,
          validator: (val) {
            if (val.isNotBBlank) {
              if (val!.contains("@") ||
                  val.contains(".") && incorrectEmailMessage != null) {
                var isValid = isValidEmail(val);
                if (!isValid) return incorrectEmailMessage;
              } else if (incorrectUsernameMessage != null) {
                if (val.length < 3) return incorrectUsernameMessage;
              }
            }
            if (validator != null) return validator(val);
            return null;
          },
          keyboardType: keybordType ?? TextInputType.emailAddress,
          fillColor: Colors.white,
        );
}

Widget get _inputTextPrefixIcon {
  return Icon(
    Icons.email,
    color: ColorGen.primaryColor,
  );
}
