import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  void login(String username, String password) {
    if (username == 'admin' && password == '1234') {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}