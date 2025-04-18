import 'package:flutter/material.dart';

class App {
  BuildContext? _context;
  double? _height;
  double? _width;
  double? _heightPadding;
  double? _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height ??
        -((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width ?? -(_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height! * v;
  }

  double appWidth(double v) {
    return (_width! * v);
  }

  double appVerticalPadding(double v) {
    return _heightPadding! * v;
  }

  double appHorizontalPadding(double v) {
//    int.parse(settingRepo.setting.mainColor.replaceAll("#", "0xFF"));
    return _widthPadding! * v;
  }
}

class AppColors {
  static Color backgraundDark = const Color(0xFF002359);

  static Color backgraundDarkAcik = const Color(0xFF02327E);

  static Color backgraundLight = const Color(0xffffffff);
  static Color backgraundLightKoyu = const Color(0xFFb8b4da);

  static Color textColorDark = const Color(0xffffffff);
  static Color textColorLight = const Color(0xFF002359);
}

class TextStyles {
  /// Declare a base style for each Family
  static const TextStyle raleway =
  const TextStyle(fontWeight: FontWeight.w400, height: 1);
  static const TextStyle fraunces =
  const TextStyle(fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 => fraunces.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 48,
      letterSpacing: -1,
      height: 1.17);
  static TextStyle get h2 =>
      h1.copyWith(fontSize: 24, letterSpacing: -.5, height: 1.16);
  static TextStyle get h3 =>
      h1.copyWith(fontSize: 14, letterSpacing: -.05, height: 1.29);
  static TextStyle get title1 =>
      raleway.copyWith(fontWeight: FontWeight.bold, fontSize: 16, height: 1.31);
  static TextStyle get title2 =>
      title1.copyWith(fontWeight: FontWeight.w500, fontSize: 14, height: 1.36);
  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: 14, height: 1.71);
  static TextStyle get body2 =>
      body1.copyWith(fontSize: 12, height: 1.5, letterSpacing: .2);
  static TextStyle get body3 =>
      body1.copyWith(fontSize: 12, height: 1.5, fontWeight: FontWeight.bold);
  static TextStyle get callout1 => raleway.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 12,
      height: 1.17,
      letterSpacing: .5);
  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: 10, height: 1, letterSpacing: .25);
  static TextStyle get caption =>
      raleway.copyWith(fontWeight: FontWeight.w500, fontSize: 11, height: 1.36);
}
