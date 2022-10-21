import 'package:clinic_manager/features/patient/doctor_detail/screens/doctor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

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
          'Review Summary',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child:
                const Icon(Icons.qr_code_scanner, color: AppColors.textColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const DoctorCard1(
            image: 'assets/images/doctor2.png',
            name: "Minh Hung",
            title1: "Imonologists",
            title2: "Christ Hospital in London, UK",
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),

            width: double.infinity, //
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.backgroudColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 10.0,
                  offset: const Offset(5.0, 5.0),
                ),
              ],
            ),
            child: Column(
              children: const [
                RowData(title: 'Date & Hour', data: 'Dec 23,2024 | 10:00AM'),
                SizedBox(height: 20),
                RowData(title: 'Package', data: 'Messaging'),
                SizedBox(height: 20),
                RowData(title: 'Dura  tion', data: '30 minutes'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),

            width: double.infinity, //
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.backgroudColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 10.0,
                  offset: const Offset(5.0, 5.0),
                ),
              ],
            ),
            child: Column(
              children: const [
                RowData(title: 'Amount', data: '\$20'),
                SizedBox(height: 20),
                RowData(title: 'Duration (30 mins)', data: '1 x \$20'),
                SizedBox(height: 20),
                Divider(color: Colors.black),
                SizedBox(height: 20),
                RowData(title: 'Total ', data: '\$20'),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),

            width: double.infinity, //
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.backgroudColor,
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
                  'assets/icons/zalopay.svg',
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Zalo Pay',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Change',
                    style: TextStyle(
                        color: AppColors.primaryColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () => Get.toNamed(RouteNames.enterPinScreen),
                text: 'Next',
              )),
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  final String title;
  final String data;
  const RowData({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          data,
          style: const TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
