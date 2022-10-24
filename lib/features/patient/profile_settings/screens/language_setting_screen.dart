import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/common/widgets/custom_password_field.dart';
import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

List<String> listLanguage = [
  "English (US)",
  "English (UK)",
  "Viet Nam",
  "Italian",
  "France",
];

class LanguageSettingScreen extends StatelessWidget {
  LanguageSettingScreen({super.key});
  RxInt check = 0.obs;

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
          'Language',
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
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suggested',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RowTitleRadio(
                      title: listLanguage[0],
                      index: 0,
                      groupValue: check.value,
                      func: (value) {
                        check.value = value!;
                      }),
                  RowTitleRadio(
                      title: listLanguage[1],
                      index: 1,
                      groupValue: check.value,
                      func: (value) {
                        check.value = value!;
                      }),
                  const Divider(color: AppColors.textColor1),
                  const SizedBox(height: 10),
                  const Text(
                    'Language',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 2; i < listLanguage.length; i++)
                    RowTitleRadio(
                        title: listLanguage[i],
                        index: i,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowTitleRadio extends StatelessWidget {
  final String title;
  final int index;
  final int groupValue;
  final Function(int?) func;
  const RowTitleRadio(
      {super.key,
      required this.title,
      required this.index,
      required this.groupValue,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        const Spacer(),
        Radio(value: index, groupValue: groupValue, onChanged: func),
      ],
    );
  }
}
