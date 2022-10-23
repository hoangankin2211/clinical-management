import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';
import '../../list_appointment_screen/screens/message_screeen.dart';
import '../../my_appointment/screens/my_appointment_screen.dart';
import '../../my_appointment/widgets/cancelled_card.dart';
import '../../my_appointment/widgets/completed_card.dart';
import '../../my_appointment/widgets/upcoming_card.dart';

class HistoryActiScreen extends StatelessWidget {
  const HistoryActiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text(
                  'Message',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Tab(
                icon: Text(
                  'Voice Call',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Tab(
                icon: Text(
                  'Video Call',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
            unselectedLabelColor: AppColors.textColor1,
            labelColor: AppColors.primaryColor1,
          ),
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/experiences.svg',
                color: AppColors.primaryColor1,
                height: 35,
                width: 35,
              ),
              const Text(
                ' History',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          actions: [
            InkWell(
              onTap: () async {},
              child: const Icon(Icons.search, color: AppColors.textColor),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz, color: AppColors.textColor),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(height: 10.0),
                  MessHistoryItem(
                    image: 'assets/images/doctor2.png',
                    name: 'Dr. Draken Boeson',
                    time: DateTime.now(),
                    lastTitle: 'My Pleasuure All the best for the paitent',
                  ),
                  MessHistoryItem(
                    image: 'assets/images/doctor3.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    lastTitle: 'Your Solution is Greate',
                  ),
                  MessHistoryItem(
                    image: 'assets/images/doctor1.png',
                    name: 'Dr. Draken Boeson',
                    time: DateTime.now(),
                    lastTitle: 'My Pleasuure All the best for the paitent',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(height: 10.0),
                  CallHistoryItem(
                    image: 'assets/images/doctor3.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Voice Call',
                  ),
                  CallHistoryItem(
                    image: 'assets/images/doctor2.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Voice Call',
                  ),
                  CallHistoryItem(
                    image: 'assets/images/doctor1.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Voice Call',
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(height: 10.0),
                  CallHistoryItem(
                    image: 'assets/images/doctor3.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Video Call',
                  ),
                  CallHistoryItem(
                    image: 'assets/images/doctor2.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Video Call',
                  ),
                  CallHistoryItem(
                    image: 'assets/images/doctor1.png',
                    name: 'Dr. Aidan Allende',
                    time: DateTime.now(),
                    pacakage: 'Video Call',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CallHistoryItem extends StatelessWidget {
  final String image;
  final String name;
  final DateTime time;
  final String pacakage;
  const CallHistoryItem(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.pacakage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.backgroudColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(children: [
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
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.textColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                pacakage,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '${DateFormat().add_yMEd().format(time)} | ${DateFormat().add_jm().format(time)}',
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: () => Get.toNamed(RouteNames.callRecordScreen,
              arguments: pacakage == 'Voice Call' ? 0 : 1),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
            child: const Icon(Icons.arrow_circle_right_sharp,
                color: AppColors.primaryColor1, size: 20),
          ),
        ),
      ]),
    );
  }
}

class MessHistoryItem extends StatelessWidget {
  final String image;
  final String name;
  final String lastTitle;
  final DateTime time;
  const MessHistoryItem({
    Key? key,
    required this.image,
    required this.name,
    required this.lastTitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: InkWell(
        onTap: () => Get.toNamed(RouteNames.messageScreen),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textColor.withOpacity(0.2),
                    blurRadius: 10.0,
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    lastTitle,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 80.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat().add_MEd().format(time),
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    DateFormat().add_jm().format(time),
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
