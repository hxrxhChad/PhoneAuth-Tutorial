// ignore_for_file: file_names, prefer_final_fields, unused_field, recursive_getters, unused_local_variable, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => isSignedIn;

  AuthProvider() {
    chechSign();
  }
  void chechSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }
}
