import 'dart:convert';

import 'package:clinic_manager/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/api_link.dart';
import '../../../constants/error_handing.dart';
import '../../../routes/route_name.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  signInAndLoading(BuildContext context) async {
    isLoading.value = true;
    update();
    AuthService.instance.signIn(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        updataLoading: () {
          isLoading.value = false;
          update();
        });
  }

  @override
  void onInit() {
    super.onInit();
    emailController.text = "hung1@gmail.com";
    passwordController.text = "test1223";
  }
}
