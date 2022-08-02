import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/models/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionViewModel with ChangeNotifier {
  Future<bool> saveUser(SessionModel session) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", session.token.toString());
    notifyListeners();
    return true;
  }

  Future<SessionModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return SessionModel(token: sp.getString("token"));
  }

  Future<bool> logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
