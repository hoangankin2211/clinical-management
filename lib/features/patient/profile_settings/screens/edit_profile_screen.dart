import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    numberController.text = "+11.0935703991";
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: "Update",
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
          'Edit Profile',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomTextField1(
                  controller: fullNameController,
                  hintText: "Full Name",
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
                CustomTextField1(
                  controller: fullNameController,
                  hintText: "Name",
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat().add_yMd().format(DateTime.now()),
                          style: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/Calendar.svg',
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            focusColor: AppColors.textColor1,
                            // fillColor: GlobalVariables.secondaryColor,
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/Message.svg'),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                //america
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'United States',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: AppColors.textColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(children: [
                          Image.asset('assets/images/america.png',
                              height: 30, width: 40),
                          const Icon(Icons.arrow_drop_down,
                              color: AppColors.textColor),
                        ]),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          controller: numberController,
                          decoration: const InputDecoration(
                            focusColor: AppColors.textColor1,
                            // fillColor: GlobalVariables.secondaryColor,
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Male',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: AppColors.textColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
