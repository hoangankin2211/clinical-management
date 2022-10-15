import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handing.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn({required BuildContext context}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
          'https://clinical-management-nmcnpm.herokuapp.com/api/signin',
        ),
        body: jsonEncode(
          {
            'email': emailController.text,
            'password': passwordController.text,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // // ignore: use_build_context_synchronously
          // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // // ignore: use_build_context_synchronously
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   (jsonDecode(res.body)['type'] == 'user')
          //       ? BottomBar.routeName
          //       : AdminScreen.routeName,
          //   (route) => false,
          // );
          print("Success");
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController.text = "hung1@gmail.com";
    passwordController.text = "test1223";
  }
}
