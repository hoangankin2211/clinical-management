import 'package:clinic_manager/features/patient/articles/screens/articles_main_screen.dart';
import 'package:clinic_manager/features/patient/history_acti/screens/history_acti_screen.dart';
import 'package:clinic_manager/features/patient/my_appointment/screens/my_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/screens/home_screens.dart';

class DashboardController extends GetxController {
  RxInt page = 0.obs;
  List<Widget> pages = [
    HomeScreen(),
    MyAppointmentScreen(),
    HistoryActiScreen(),
    ArticlesMainScreen(),
    const Center(child: Text('profiles')),
  ];

  void updatePage(int value) {
    page.value = value;
    update();
  }
}
