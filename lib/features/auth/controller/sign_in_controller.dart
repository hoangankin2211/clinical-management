import 'dart:convert';

import 'package:clinic_manager/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widgets/custom_dialog_error/error_dialog.dart';
import '../../../constants/api_link.dart';
import '../../../constants/error_handing.dart';
import '../../../routes/route_name.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  void signIn({required BuildContext context}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
          '${ApiLink.uri}/api/signin',
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
      isLoading.value = false;
      update();
    }
    isLoading.value = false;
    update();
  }

  signInAndLoading(BuildContext context) async {
    isLoading.value = true;
    update();
    signIn(context: context);
  }

  @override
  void onInit() {
    super.onInit();
    emailController.text = "hung1@gmail.com";
    passwordController.text = "test1223";
  }
}
