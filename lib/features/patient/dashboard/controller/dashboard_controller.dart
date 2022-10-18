import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/screens/home_screens.dart';

class DashboardController extends GetxController {
  RxInt page = 0.obs;
  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Appointment')),
    const Center(child: Text('History')),
    const Center(child: Text('Articles')),
    const Center(child: Text('profiles')),
  ];

  void updatePage(int value) {
    page.value = value;
    update();
  }
}
