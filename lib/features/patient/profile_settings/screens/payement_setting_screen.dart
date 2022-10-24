import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';

List<Map<String, dynamic>> listPay = [
  {'image': 'assets/icons/google_pay.svg', 'title': 'Google Pay'},
  {'image': 'assets/icons/zalopay.svg', 'title': 'Zalo Pay'},
  {'image': 'assets/icons/apple.svg', 'title': 'Apple Pay'},
];

class PaymentSettingScreen extends StatelessWidget {
  PaymentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: "Add New Card",
            onTap: () {},
          )),
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
          'Payment',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: const Icon(Icons.qr_code, color: AppColors.textColor)),
          const SizedBox(width: 10.0),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          ...listPay.map(
            (e) => Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textColor.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: const Offset(5.0, 5.0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    e['image'],
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e['title'],
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Connected',
                    style: TextStyle(
                        color: AppColors.primaryColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
