import 'dart:convert';

import 'package:management_project/application/configs/app_const.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sessions {
  static Future<SharedPreferences> prefs =
      SharedPreferences.getInstance().then((SharedPreferences prefs) => prefs);

  static Future<String> get tokenUser async {
    SharedPreferences prefs_ = await prefs;

    String? token = prefs_.getString(App.tokenKey);
    return token!;
  }

  static Future<bool> get isLogged async {
    SharedPreferences prefs_ = await prefs;

    String? token = prefs_.getString(App.tokenKey);
    return token != null ? true : false;
  }

  static Future<UserModel?> get userData async {
    SharedPreferences prefs_ = await prefs;

    String? userData_ = prefs_.getString(App.userDataKey);

    if (userData_ == null) {
      return null;
    } else {
      UserModel user = UserModel.fromJson(json.decode(userData_));
      return user;
    }
  }

  static Future<bool> setUserToken({required String token}) async {
    SharedPreferences prefs_ = await prefs;
    return await prefs_.setString(App.tokenKey, token);
  }

  static Future<String?> getUserToken() async {
    SharedPreferences prefs_ = await prefs;
    return prefs_.getString(App.tokenKey);
  }

  static Future<bool> setUserSessions({required UserModel userData}) async {
    SharedPreferences prefs_ = await prefs;
    String user = json.encode(userData);
    return await prefs_.setString(App.userDataKey, user);
  }

  static Future<void> unsetUserSessions() async {
    SharedPreferences prefs_ = await prefs;
    await prefs_.remove(App.tokenKey);
    await prefs_.remove(App.userDataKey);
  }
}
