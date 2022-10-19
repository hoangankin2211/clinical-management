import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_horiz, color: AppColors.textColor),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          NotificationItem(
            mainTitle: 'Appointment Cancelled',
            time: DateTime.now(),
            type: 0,
            title:
                'You have successfully canceled your appointment with Dr.Alan Waston on December 24,2024, 13:00 pm 80% of the funds will be returned to your account',
          ),
          NotificationItem(
            mainTitle: 'Schedule Changed',
            time: DateTime.now(),
            type: 1,
            title:
                'You have successfully changed schedule an appointment with Dr.Alan Waston on December 24,2024, 13:00 pm. Don\'t forget to activate your reminder',
          ),
          NotificationItem(
            mainTitle: 'Appointment Success!',
            time: DateTime.now(),
            type: 2,
            title:
                'You have successfully booked an appointment with Dr.Alan Waston on December 24,2024, 10:00 am. Don\'t forget to activate your reminder',
          ),
          NotificationItem(
            mainTitle: 'New Services Available!',
            time: DateTime.now(),
            type: 3,
            title:
                'You can new make multiple doctoral appointments at once You can also cancel your appointment',
          ),
          NotificationItem(
            mainTitle: 'Credit Card Connected!',
            time: DateTime.now(),
            type: 4,
            title:
                'Your credit card has been successfully linked with Medica Enjoy our service',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String mainTitle;
  final DateTime time;
  final int type;
  final String title;
  const NotificationItem({
    Key? key,
    required this.mainTitle,
    required this.time,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/icons/cancle.svg',
      'assets/icons/schedule1.svg',
      'assets/icons/schedule1.svg',
      'assets/icons/Shield Done.svg',
      'assets/icons/card.svg'
    ];
    List<Color> color1 = [
      Colors.red.withOpacity(0.2),
      Colors.green.withOpacity(0.2),
      Colors.blue.withOpacity(0.2),
      Colors.orange.withOpacity(0.2),
      Colors.blue.withOpacity(0.2),
    ];
    List<Color> color2 = [
      Colors.red.withOpacity(0.7),
      Colors.green.withOpacity(0.7),
      Colors.blue.withOpacity(0.7),
      Colors.orange.withOpacity(0.7),
      Colors.blue.withOpacity(0.7),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color1[type],
                ),
                child: SvgPicture.asset(
                  images[type],
                  color: color2[type],
                  height: 25,
                  width: 25,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${DateFormat().add_MEd().format(time)} | ${DateFormat().add_jm().format(time)}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              type == 0 || type == 1
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor1.withOpacity(0.8)),
                        child: const Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(title,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 13,
              ))
        ],
      ),
    );
  }
}
//cancle.svg
//schedule1.svg
//card.svg