import 'package:clinic_manager/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../routes/route_name.dart';

class PatientDetailScsreen extends StatelessWidget {
  PatientDetailScsreen({super.key});
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Patient Detail',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Full Name',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.textColor1.withOpacity(0.1),
              ),
              child: const Text(
                'Nguyen Minh Hung',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.textColor1.withOpacity(0.1),
              ),
              child: Row(
                children: const [
                  Text(
                    'Male',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down,
                      color: AppColors.textColor, size: 25.0)
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your age',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.textColor1.withOpacity(0.1),
              ),
              child: Row(
                children: const [
                  Text(
                    '27 years',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down,
                      color: AppColors.textColor, size: 25.0)
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Write Your Problem',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomTextField1(
              controller: textController,
              hintText: 'Description',
              maxLines: 7,
            ),
          ),
          const SizedBox(height: 40.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () => Get.toNamed(RouteNames.payementScreen),
                text: 'Next',
              )),
        ],
      ),
    );
  }
}
