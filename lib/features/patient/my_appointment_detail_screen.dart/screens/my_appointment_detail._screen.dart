import 'package:clinic_manager/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../constants/app_color.dart';
import '../../doctor_detail/screens/doctor_detail_screen.dart';

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

class MyAppointmentDetailScreen extends StatelessWidget {
  MyAppointmentDetailScreen({super.key});
  final arg = Get.arguments as int;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () => Get.toNamed(RouteNames.messageScreen),
          child: Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.primaryColor1,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  listPackage[arg]['image'],
                  color: AppColors.backgroudColor,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(width: 10.0),
                Text(
                  '${listPackage[arg]['mainTitle']} (Start at 16:00 PM)',
                  style: const TextStyle(
                      color: AppColors.backgroudColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'My Appointment',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: AppColors.textColor),
                color: AppColors.backgroudColor,
              ),
              child: const Icon(Icons.more_horiz, color: AppColors.textColor),
            ),
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
          const DoctorCard1(
            image: 'assets/images/doctor2.png',
            name: "Dr.Minh Hung",
            title1: "Imonologists",
            title2: "Christ Hospital in London, UK",
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Scheduled Appointment',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Today, December 22,2022',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                SizedBox(height: 20.0),
                Text(
                  '16:00 - 16:30 PM (30 minutes)',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Patient Information',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: const [
                      SizedBox(
                        // color: Colors.red,
                        width: 100,
                        height: 20,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': Andrew Ainsley',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: const [
                      SizedBox(
                        // color: Colors.red,
                        width: 100,
                        height: 20,
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': Male',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: const [
                      SizedBox(
                        // color: Colors.red,
                        width: 100,
                        height: 20,
                        child: Text(
                          'Age',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': 27',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        // color: Colors.red,
                        width: 100,
                        height: 20,
                        child: Text(
                          'Problem ',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: ReadMoreText(
                          ': Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.',
                          trimLines: 4,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor1,
                          ),
                          lessStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Your Package ',
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: AppColors.backgroudColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  color: AppColors.textColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(listPackage[arg]['image'],
                      color: AppColors.primaryColor1, height: 30, width: 30),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listPackage[arg]['mainTitle'],
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        listPackage[arg]['title'],
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
                  width: 60,
                  child: Column(children: [
                    Text('\$${listPackage[arg]['price']}',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
