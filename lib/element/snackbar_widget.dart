
import 'package:flutter/material.dart';
import '../gen/color_gen.dart';
import 'widgets/custom_text.dart';

void showSnackBar(BuildContext context, {String text = ''}) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    content: CustomText(
      text:text,
      textAlign: TextAlign.center,
        fontSize: 16
    ),
    backgroundColor: ColorGen.deneme,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
    elevation: 5,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
