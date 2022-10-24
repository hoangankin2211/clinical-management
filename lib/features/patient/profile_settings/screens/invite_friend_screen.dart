import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/common/widgets/custom_password_field.dart';
import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

List<Map<String, dynamic>> fakeListFriend = [
  {
    'image': 'assets/images/doctor1.png',
    'name': 'Nguyen Minh Hung',
    'phone': '+11.24035453346',
    'check': 0,
  },
  {
    'image': 'assets/images/doctor2.png',
    'name': 'Truong Huynh Duc hoang',
    'phone': '+11.3554654767',
    'check': 1,
  },
  {
    'image': 'assets/images/doctor3.png',
    'name': 'Nguyen Trung Hieu',
    'phone': '+11.445463446',
    'check': 0,
  }
];

class InviteFriendScreen extends StatelessWidget {
  InviteFriendScreen({super.key});
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
          'Invite Friend',
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
          Column(
            children: [
              ...fakeListFriend.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(e['image']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: AppColors.textColor.withOpacity(0.3),
                              )
                            ]),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['name'],
                              style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              e['phone'],
                              style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 3),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 7.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                  width: 2, color: AppColors.primaryColor1),
                              color: (e['check'] == 0)
                                  ? AppColors.primaryColor1
                                  : Colors.white,
                            ),
                            child: Text('Invite',
                                style: TextStyle(
                                    color: (e['check'] == 1)
                                        ? AppColors.primaryColor1
                                        : Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
