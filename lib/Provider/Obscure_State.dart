import 'package:flutter/material.dart';

class ObscureState with ChangeNotifier {
  bool _isObscured = true;

  bool get isObscured => _isObscured;

  void toggleObscure() {
    _isObscured = !_isObscured;
    notifyListeners();
  }
}
