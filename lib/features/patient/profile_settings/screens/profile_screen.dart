import 'package:clinic_manager/features/patient/profile_settings/screens/edit_profile_screen.dart';
import 'package:clinic_manager/features/patient/profile_settings/screens/help_center_screen.dart';
import 'package:clinic_manager/features/patient/profile_settings/screens/language_setting_screen.dart';
import 'package:clinic_manager/features/patient/profile_settings/screens/notification_settings.dart';
import 'package:clinic_manager/features/patient/profile_settings/screens/payement_setting_screen.dart';
import 'package:clinic_manager/features/patient/profile_settings/screens/security_setting_screen.dart';
import 'package:clinic_manager/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import 'invite_friend_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  RxBool check = false.obs;
  final AuthService _auth = AuthService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/experiences.svg',
              color: AppColors.primaryColor1,
              height: 35,
              width: 35,
            ),
            const Text(
              ' Profile',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_horiz, color: AppColors.textColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/doctor2.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Nguyen Minh Hung',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(EditProfileScreen()),
                            child: Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.primaryColor,
                              ),
                              child: const Icon(Icons.edit,
                                  color: Colors.white, size: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.0),
                      const Divider(color: AppColors.textColor),
                      const SizedBox(height: 2.0),
                      Row(
                        children: const [
                          Icon(Icons.phone,
                              color: AppColors.primaryColor1, size: 15),
                          Text(
                            ' +84.09435703991',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.email,
                              color: AppColors.primaryColor1, size: 15),
                          Text(
                            ' hungngnyen.201102ak@gmail.com',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.person,
                              color: AppColors.primaryColor1, size: 15),
                          Text(
                            ' Male',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 40, child: Column())
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              children: [
                RowProfile(
                  icon: 'assets/icons/Notification.svg',
                  title: 'Notification',
                  press: () => Get.to(() => NotificationSettingScreen()),
                ),
                RowProfile(
                  icon: 'assets/icons/Document.svg',
                  title: 'Payement',
                  press: () => Get.to(() => PaymentSettingScreen()),
                ),
                RowProfile(
                  icon: 'assets/icons/Shield Done.svg',
                  title: 'Security',
                  press: () => Get.to(() => SecuritySettingScreen()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: InkWell(
                    onTap: () => Get.to(() => LanguageSettingScreen()),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Filter.svg',
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Language',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const Text(
                          'VietNam(Vie) ',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_circle_right,
                          color: AppColors.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const SizedBox(width: 10.0),
                        const Icon(Icons.remove_red_eye_outlined,
                            color: AppColors.textColor, size: 19),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Dark Mode',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Obx(() => Switch(
                            value: check.value,
                            onChanged: (value) {
                              check.value = value;
                            })),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: RowProfile(
                    icon: 'assets/icons/Profile.svg',
                    title: 'Invite Friends',
                    press: () => Get.to(() => InviteFriendScreen()),
                  ),
                ),
                const SizedBox(height: 10.0)
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              children: [
                RowProfile(
                  icon: 'assets/icons/experiences.svg',
                  title: 'Help Center',
                  press: () => Get.to(() => HelpCenterScreen()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: () => _auth.logOut(context),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Logout.svg',
                          height: 20.0,
                          width: 20.0,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Log out',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowProfile extends StatelessWidget {
  final String icon;
  final String title;
  final Function() press;
  const RowProfile({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 20.0,
              width: 20.0,
            ),
            const SizedBox(width: 10.0),
            Text(
              title,
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_circle_right,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
