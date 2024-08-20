// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginState with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<int?> login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {'email': email, 'password': password},
      );
      debugPrint(
          "Email : $email\nPassword : $password\nStatus Code : ${response.statusCode.toInt()}");

      setLoading(false);
      return response.statusCode.toInt();
    } catch (e) {
      debugPrint(e.toString());
      setLoading(false);
      return null;
    }
  }
}
