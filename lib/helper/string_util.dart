
extension StringUtil on String? {
  bool get isBBlank => (this == null || this!.trim() == "");

  bool get isNotBBlank {
    return !isBBlank;
  }
}

// class StringUtil {
//   static bool isEmpty(String? string) => string == null || string.trim() == "";
//
//   static bool isNotEmpty(String? string) => !isEmpty(string);
// }
