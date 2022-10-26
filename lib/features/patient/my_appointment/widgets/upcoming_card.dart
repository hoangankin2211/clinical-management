import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

class UpcomingCard extends StatelessWidget {
  final String name;
  final String image;
  final int type;
  final DateTime time;
  final Function() cancelled;

  const UpcomingCard({
    Key? key,
    required this.name,
    required this.image,
    required this.type,
    required this.time,
    required this.cancelled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listPackage = [
      {
        'image': 'assets/icons/chat.svg',
        'mainTitle': 'Messaging',
      },
      {
        'image': 'assets/icons/call.svg',
        'mainTitle': 'Voice Call',
      },
      {
        'image': 'assets/icons/experiences.svg',
        'mainTitle': 'Advise',
      }
    ];
    return InkWell(
      onTap: () =>
          Get.toNamed(RouteNames.myAppointmentDetailScreen, arguments: type),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.backgroudColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.textColor.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(5.0, 5.0)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                const SizedBox(width: 7.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '${listPackage[type]['mainTitle']} - ',
                            style: const TextStyle(
                                color: AppColors.textColor, fontSize: 11),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 1, color: AppColors.primaryColor1),
                            ),
                            child: const Text(
                              'Upcoming',
                              style: TextStyle(
                                color: AppColors.primaryColor1,
                                fontSize: 11,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${DateFormat().add_MEd().format(time)} | ${DateFormat().add_jms().format(time)}',
                        style: const TextStyle(
                            color: AppColors.textColor, fontSize: 12),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  child: SvgPicture.asset(listPackage[type]['image'],
                      height: 30.0,
                      width: 30.0,
                      color: AppColors.primaryColor1),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: AppColors.textColor),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: cancelled,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                width: 2,
                                color: AppColors.primaryColor1,
                              )),
                          child: const Text(
                            'Cancel Appointment',
                            style: TextStyle(
                                color: AppColors.primaryColor1,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ))),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                      onTap: () => Get.toNamed(
                          RouteNames.reasonScheduleChangeScreen,
                          arguments: "Reschedule Appointment"),
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.primaryColor1),
                          child: const Text(
                            'Reschedule',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
