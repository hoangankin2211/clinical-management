import 'package:clinic_manager/services/auth_services.dart';
import 'package:flutter/material.dart';

class StartService {
  StartService._privateConstructor();
  static final StartService instance = StartService._privateConstructor();
  init() async {
    await AuthService.instance.getUserData();
  }
}
