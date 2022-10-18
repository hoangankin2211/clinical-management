import 'dart:convert';

import 'package:clinic_manager/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants/api_link.dart';
import '../constants/error_handing.dart';
import '../models/user.dart';
import '../routes/route_name.dart';

class AuthService extends ChangeNotifier {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();
  // ignore: prefer_final_fields
  User _user = User(
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    id: '',
    token: '',
  );
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  bool get isLogin => user.id == '' ? false : true;

  Future<bool> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('${ApiLink.uri}/api/validToken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
      var response = jsonDecode(tokenRes.body);
      if (response["check"]) {
        setUser(tokenRes.body);
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Get.offAllNamed(RouteNames.introScreen);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signIn(
      {required BuildContext context,
      required String email,
      required String password,
      required VoidCallback updataLoading}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
          '${ApiLink.uri}/api/signin',
        ),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          AuthService.instance.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Get.offAllNamed(RouteNames.dashboardScreen);
        },
      );
    } catch (e) {
      updataLoading();
    }
    updataLoading();
  }
}

  // var response = jsonDecode(tokenRes.body);
      // if (response == true) {
      //   http.Response userRes = await http.get(
      //     Uri.parse("https://clinical-management-nmcnpm.herokuapp.com/getUser"),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'x-auth-token': token,
      //     },
      //   );
      //   print(userRes.body);
      //   // ignore: use_build_context_synchronously
      //   setUser(userRes.body);
      //   return false;
      // }