import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/common/widgets/custom_password_field.dart';
import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:clinic_manager/features/patient/profile_settings/controller/profile_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../services/auth_services.dart';

List<String> listTitle = [
  "Remember Me",
  "Face ID",
  "Biometric ID",
];

class SecuritySettingScreen extends StatelessWidget {
  SecuritySettingScreen({super.key});
  final TextEditingController password = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController rePass = TextEditingController();
  final _controller = Get.find<ProfileSettingController>();
  List<RxBool> checkSwitch = [
    for (int i = 0; i < listTitle.length; i++) false.obs
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
          'Security',
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
          const SizedBox(height: 20.0),
          Obx(
            () => Column(
              children: [
                for (int i = 0; i < listTitle.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listTitle[i],
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
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: const [
                Text(
                  'Google Authenticator',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(Icons.arrow_circle_right, color: AppColors.primaryColor1),
                SizedBox(width: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.backgroudColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Change PassWord',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                CustomPasswordField(
                  controller: _controller.passwordController,
                  hintText: "Enter Your Passwrod",
                  labelText: "Password",
                ),
                const SizedBox(height: 20.0),
                CustomPasswordField(
                  controller: _controller.newpasswordController,
                  hintText: "Enter New Pasaword",
                  labelText: "New Password",
                ),
                const SizedBox(height: 20.0),
                CustomPasswordField(
                  controller: _controller.rePasswordController,
                  hintText: "Enter Re Password",
                  labelText: "Re Password",
                ),
                const SizedBox(height: 10.0),
                Obx(
                  () => ElevatedButton(
                    onPressed: () => _controller.changePassword(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: _controller.isLoading.value
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white))
                        : const Text(
                            'Change Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(text: 'Change Pin Code', onTap: () {}),
          )
        ],
      ),
    );
  }
}
