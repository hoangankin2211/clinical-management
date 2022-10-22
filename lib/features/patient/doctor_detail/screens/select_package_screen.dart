import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

List<Map<String, dynamic>> listPackage = [
  {
    'image': 'assets/icons/chat.svg',
    'mainTitle': 'Messaging',
    'title': 'Chat message with doctor',
    'price': 20,
  },
  {
    'image': 'assets/icons/call.svg',
    'mainTitle': 'Voice Call',
    'title': 'Voice Call with doctor',
    'price': 40,
  },
  {
    'image': 'assets/icons/experiences.svg',
    'mainTitle': 'Advise',
    'title': 'Get Advise from doctor',
    'price': 60,
  }
];

class SelectPackageScreen extends StatelessWidget {
  SelectPackageScreen({super.key});
  RxInt select = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            onTap: () => Get.toNamed(RouteNames.patientDetailScreen),
            text: 'Next',
          )),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Select Package',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroudColor,
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
                'Select Duration',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.textColor1.withOpacity(0.2),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.timelapse_outlined,
                    color: AppColors.textColor,
                    size: 18,
                  ),
                  Text(
                    '  30 minutes',
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
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Package',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Obx(() => Column(
                children: [
                  for (int i = 0; i < listPackage.length; i++)
                    PackageCard(
                        select: select.value,
                        i: i,
                        press: () => select.value = i),
                ],
              )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
    required this.select,
    required this.i,
    required this.press,
  }) : super(key: key);

  final int select;
  final int i;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(listPackage[i]['image'],
                  color: AppColors.primaryColor1, height: 20, width: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listPackage[i]['mainTitle'],
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    listPackage[i]['title'],
                    style: const TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 50,
              child: Column(children: [
                Text('\$${listPackage[i]['price']}',
                    style: const TextStyle(
                        color: AppColors.primaryColor1,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const Text('30 mins',
                    style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ]),
            ),
            const SizedBox(width: 3),
            Container(
              height: 18,
              width: 18,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 2, color: AppColors.primaryColor1)),
              child: Container(
                // height: 20,
                // width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        select == i ? AppColors.primaryColor1 : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
