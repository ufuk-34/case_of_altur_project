import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../element/snackbar_widget.dart';

class Helper {
  BuildContext? context;
  DateTime? currentBackPressTime;

  Helper.of(BuildContext _context) {
    this.context = _context;
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      showSnackBar(context!, text: "Tap again to exit");

      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }
}
