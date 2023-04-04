import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/client_services.dart';
import '../services/user_services.dart';

class AuthProvider extends ChangeNotifier {
  late String token = "";
  User? user;

  bool get isAuth {
    // print("---------- $token");
    getToken();
    // print("is auth $token");
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      return true;
    }

    return false;
    print('skfekrfekrfergergerg ITS WORKING');
  }

  void signup({required String username, required String password}) async {
    token = await AuthServices().signup(username: username, password: password);
    user = User.fromJson(Jwt.parseJwt(token));
    setToken(token);
    notifyListeners();
  }

  Future<void> signin(
      {required String username, required String password}) async {
    token = await AuthServices().signin(username: username, password: password);
    user = User.fromJson(Jwt.parseJwt(token));

    setToken(token);
    notifyListeners();
  }

  void logout() {
    token = "";

    print('YOU HAVE SIGNED OUT');
    notifyListeners();
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access', token);
    notifyListeners();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access') ?? "";
    print(token);
    notifyListeners();
  }
}
