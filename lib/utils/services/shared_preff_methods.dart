import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/onbording/data/models/user_model.dart';

class sharedPreffMethods {
  static const String _userKey = 'user_data';

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<UserModel?> getUer() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userKey);
    if (data != null) {
      return UserModel.fromJson(jsonDecode(data));
    }
    return null;
  }
}
