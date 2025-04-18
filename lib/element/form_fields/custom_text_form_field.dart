
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constant.dart';
import '../../gen/border_radius_gen.dart';
import '../../gen/color_gen.dart';
import '../../gen/paddig_gen.dart';
import 'package:case_of_altur_project/helper/string_util.dart';

import '../../helper/error_tooltip.dart';


class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool autofocus;
  final bool readOnly;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextStyle? style;
  final EdgeInsets? margin;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelTextStyle;
  final String? counterText;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final TextEditingController? textEditingController;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.initialValue,
    this.suffixIcon,
    this.contentPadding,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofocus = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.style,
    this.margin,
    this.counterText,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelTextStyle,
    this.fillColor,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var errorMessage = "";
    final ToolTipController controller = ToolTipController(message: errorMessage);
    return Padding(
      padding: margin ?? PaddingGen.buildPaddingVertical7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label == ""
              ? emptyWidget
              : Padding(
            padding: PaddingGen.buildPaddingOnlyBottom4,
            child: Text(
              label,
              style: TextStyle(
                color: ColorGen.customLightColor,
                fontFamily: font_gothic,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          TextFormField(
            controller: textEditingController,
            key: key,
            initialValue: initialValue,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            autofocus: autofocus,
            readOnly: readOnly,
            textCapitalization: textCapitalization,
            validator: (val) {
              if (validator != null) {
                String? value = validator!(val);
                return value;
              }
              return null;
            },
            autocorrect: autocorrect,
            obscureText: obscureText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSaved: onSaved,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor: fillColor ?? Colors.black26,
              hintText: hintText,
              alignLabelWithHint: true,
              hintStyle: hintStyle,
              labelText: labelText,
              labelStyle:labelTextStyle ,
              // errorStyle: const TextStyle(height: 0, color: Colors.transparent),
              border: OutlineInputBorder(
                borderRadius: BorderRadiusGen.allCircular10,
                borderSide:   BorderSide(
                  color: ColorGen.customBlueGreyColor.withOpacity(0.5),
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadiusGen.allCircular10,
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.5.w,
                  color: ColorGen.customBlueGreyColor.withOpacity(0.5),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadiusGen.allCircular10,
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.5.w,
                  color: ColorGen.customBlueGreyColor.withOpacity(0.5),
                ),
              ),

              // suffixIcon: errorMessage.value == '' ? suffixIcon : ErrorTooltip(controller: controller),
              suffixIcon: suffixIconEnd(errorMessage, controller),
              counterStyle: const TextStyle(overflow: TextOverflow.ellipsis),
              counter: counterText.isBBlank
                  ? null
                  : Text(
                counterText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: const Color(0x99000000),
                ),
              ),
              contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.w),
            ),
          )
        ],
      ),
    );
  }

  Widget suffixIconEnd(String errorMessage, ToolTipController controller) {
    if (errorMessage == '') {
      return suffixIcon ?? const SizedBox(height: 0, width: 0);
    } else {
      return ErrorTooltip(controller: controller);
      // return suffixIcon ?? ErrorTooltip(controller: controller);
    }
  }
}