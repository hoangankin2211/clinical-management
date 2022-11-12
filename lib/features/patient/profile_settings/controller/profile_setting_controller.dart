import 'dart:io';

import 'package:clinic_manager/common/widgets/custom_dialog_error/error_dialog.dart';
import 'package:clinic_manager/common/widgets/custom_dialog_error/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/user.dart';
import '../../../../services/auth_services.dart';

class ProfileSettingController extends GetxController {
  final _auth = AuthService.instance;
  User getUser() => _auth.user;
  final RxBool isLoading = false.obs;

  final Rx<User> _user = Rx<User>(
    User(
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      id: '',
      token: '',
      gender: '',
      phoneNumber: '',
      dateBorn: DateTime.now(),
      avt: '',
    ),
  );

  User get user => _user.value;

  void onInit() {
    super.onInit();
    _user.value = _auth.user;
  }

  //==================Security fiel======================
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  showDialogChagepassword(String title, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        question: "Change password",
        title1: title,
      ),
    );
  }

  void changePassword(BuildContext context) {
    if (newpasswordController.text.length >= 8) {
      if (newpasswordController.text == rePasswordController.text) {
        isLoading.value = true;
        update();
        _auth.changePassWord(
          password: passwordController.text,
          newPassword: newpasswordController.text,
          context: context,
          callBack: () {
            passwordController.clear();
            newpasswordController.clear();
            rePasswordController.clear();
            isLoading.value = false;
            update();
            showDialog(
              context: context,
              builder: (context) => const SuccessDialog(
                question: "Change password",
                title1: "Update Password Success",
              ),
            );
          },
        );
      } else {
        showDialogChagepassword('RePassword is invalid', context);
      }
    } else {
      showDialogChagepassword('Newpass is too short', context);
    }
  }

  //======================Edit profile field====================
  final RxBool isLoading1 = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final Rx<DateTime> dateBorn = DateTime.now().obs;
  final RxString genderText = ''.obs;

  void editProfile(BuildContext context) async {
    var timeStamp = dateBorn.value.millisecondsSinceEpoch;
    isLoading1.value = true;
    _auth.editProfile(
        name: nameController.text,
        email: _auth.user.email,
        gender: genderText.value,
        phoneNumber: '0935703991',
        address: 'An Khe Gia Lai',
        dateBorn: timeStamp,
        callBack: () {
          isLoading1.value = false;
          _user.value = _auth.user;
          update();
          showDialog(
            context: context,
            builder: (context) => const SuccessDialog(
              question: "Edit Profile",
              title1: "Edit Profile Success",
            ),
          );
        },
        context: context);
  }

  final RxBool isLoading2 = false.obs;

  void updateAvt(BuildContext context, File file) async {
    isLoading2.value = true;
    _auth.updateAvata(
      file: file,
      email: _auth.user.email,
      context: context,
      callback: () {
        isLoading2.value = false;
        update();
        showDialog(
          context: context,
          builder: (context) => const SuccessDialog(
            question: "Change Avt",
            title1: "Change Avt Success",
          ),
        );
      },
    );
  }
}
