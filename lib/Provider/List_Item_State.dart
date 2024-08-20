// ignore_for_file: file_names
import 'dart:async';
import 'dart:convert';

import 'package:assignment_first_login/Models/User_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListItemState with ChangeNotifier {
  Future<UserModel?> getUserModel() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    try {
      if (response.statusCode == 200) {
        var data = response.body;
        return UserModel.fromJson(json.decode(data));
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
