import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';

List<String> rowNotifi = [
  "General Notification",
  "Sound",
  "Vibrate",
  "Special Offers",
  "Promo % Discount",
  "Payments",
  "Cashback",
  "App Updates",
  "New Service Availble",
  "New Trip Availble",
];

class NotificationSettingScreen extends StatelessWidget {
  NotificationSettingScreen({super.key});
  List<RxBool> checkSwitch = [
    for (int i = 0; i < rowNotifi.length; i++) false.obs
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Obx(
            () => Column(
              children: [
                for (int i = 0; i < rowNotifi.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rowNotifi[i],
                          style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Switch(
                            value: checkSwitch[i].value,
                            onChanged: (value) {
                              checkSwitch[i].value = value;
                            })
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
