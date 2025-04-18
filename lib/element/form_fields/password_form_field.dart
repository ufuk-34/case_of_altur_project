
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';

class PasswordFormField extends StatelessWidget {
  // final TextEditingController? controller;
  final String label;
  final String? Function(String?)? onSaved;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Color? color;
  final String? counterText;
  final EdgeInsets? margin;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelTextStyle;
  final bool? visibility;
  final bool? readOnly;

  // final NgcTextFormField abc= const NgcTextFormField(label: "label");

  const PasswordFormField(
      {Key? key,
      // this.controller,
      this.margin,
      this.label = "Parola",
      this.onSaved,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.color,
      this.counterText,
      this.hintText,
      this.labelText,
      this.hintStyle,
      this.labelTextStyle,
      this.visibility,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isVisible = visibility != null ? visibility! : true;
    return CustomTextFormField(
      fillColor: Colors.white,
      readOnly: readOnly ?? false,
      margin: margin,
      initialValue: initialValue,
      validator: validator,
      keyboardType: TextInputType.visiblePassword,
      onSaved: onSaved,
      onChanged: onChanged,
      label: label,
      hintText: hintText,
      labelText: labelText,
      hintStyle: hintStyle,
      labelTextStyle: labelTextStyle,
      counterText: counterText,
      suffixIcon: IconButton(
        icon: Icon(
          isVisible ? Icons.visibility_off : Icons.visibility,
          color: color ?? Colors.white70,
        ),
        onPressed: () {
          isVisible = !isVisible;
        },
      ),
      obscureText: isVisible,
    );
  }
}
