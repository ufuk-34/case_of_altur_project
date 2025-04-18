
import 'package:case_of_altur_project/helper/string_util.dart';


const String passwordLeastCharNum = "4";
var confirmPass = "";
bool checkValidation = true;

//Regular Expressions
bool isPlateNum(String em) {
  String p =
      r'^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

String? canNotBeEmpty(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  }
  return null;
}

String? phoneNumberValidation(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  } else if (value!.length < 10) {
    return "en az 10 haneli olmalı.";
  }
  return null;
}

String? tcknValidation(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  } else if (value!.length < 11) {
    return "en az 10 haneli olmalı.";
  }
  return null;
}

bool isIP(String em) {
  String p =
      r'^(([1-9]?\d|1\d\d|2[0-5][0-5]|2[0-4]\d)\.){3}([1-9]?\d|1\d\d|2[0-5][0-5]|2[0-4]\d)$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

bool isFullName(String em) {
  String p =
      r"^([a-zA-ZğüşöçİĞÜŞÖÇ]{3,}\s)([a-zA-ZğüşöçİĞÜŞÖÇ]{1,}\s?)([a-zA-ZğüşöçİĞÜŞÖÇ]{2,}?)+$";
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

// String? passwordValidation(String? value) {
//   if (checkValidation) {
//     checkValidation = false;
//     if (value == "") {
//       return "Lütfen boş alanları doldurunuz. ";
//     } else if (value!.trim().length < 4) {
//       return "en az 4 karakter olmalı";
//     }else {
//       print("the flag is down password");
//       return null;
//     }
//   }  else {
//     checkValidation = true;
//     return null;
//   }
// }

String? adValidation(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  } else if (value!.length < 2) {
    return "en az 2 haneli olmalı.";
  }
  return null;
}

String? adresValidation(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  } else if (value!.length < 1) {
    return "en az 1 haneli olmalı.";
  }
  return null;
}

String? soyadValidation(String? value) {
  if (value.isBBlank) {
    return "boş olamaz";
  } else if (value!.length < 2) {
    return "en az 2 haneli olmalı.";
  }
  return null;
}

String? IPValidation(String value) {
  confirmPass = value;
  if (value == "") {
    if (checkValidation) {
      checkValidation = false;
      return "Lütfen boş alanları doldurunuz. ";
    } else {
      print("the flag is down password");
      return null;
    }
  } else if (!isIP(value)) {
    return "uygun formatta giriniz.";
  } else {
    checkValidation = true;
    return null;
  }
}

String? isEmptyValidation(String? value) {
  if (value == "") {
    if (checkValidation) {
      checkValidation = false;
      return "Lütfen boş alanları doldurunuz. ";
    } else {
      print("the flag is down Empty");
      return null;
    }
  } else {
    checkValidation = true;
    return null;
  }
}


extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
bool isValidEmail(String email) {
// static final email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}
