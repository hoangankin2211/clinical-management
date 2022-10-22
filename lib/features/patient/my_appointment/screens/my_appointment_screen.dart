import 'package:clinic_manager/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../widgets/cancelled_card.dart';
import '../widgets/completed_card.dart';
import '../widgets/upcoming_card.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroudColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text(
                  'Upcomming',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Tab(
                icon: Text(
                  'Completed',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Tab(
                icon: Text(
                  'Cancked',
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
                '  My Appointment',
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
                  const SizedBox(height: 20.0),
                  UpcomingCard(
                    name: 'Dr.Drake Boeson',
                    image: 'assets/images/doctor1.png',
                    type: 0,
                    time: DateTime.now(),
                  ),
                  UpcomingCard(
                    name: 'Dr.Jenny Waston',
                    type: 1,
                    image: 'assets/images/doctor2.png',
                    time: DateTime.now(),
                  ),
                  UpcomingCard(
                    name: 'Dr.Jenny Waston',
                    type: 2,
                    image: 'assets/images/doctor3.png',
                    time: DateTime.now(),
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
                  const SizedBox(height: 20.0),
                  CompletedCard(
                    name: 'Dr.Drake Boeson',
                    image: 'assets/images/doctor1.png',
                    type: 0,
                    time: DateTime.now(),
                  ),
                  CompletedCard(
                    name: 'Dr.Jenny Waston',
                    type: 1,
                    image: 'assets/images/doctor2.png',
                    time: DateTime.now(),
                  ),
                  CompletedCard(
                    name: 'Dr.Jenny Waston',
                    type: 2,
                    image: 'assets/images/doctor3.png',
                    time: DateTime.now(),
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
                  const SizedBox(height: 20.0),
                  CancelledCard(
                    name: 'Dr.Drake Boeson',
                    image: 'assets/images/doctor1.png',
                    type: 0,
                    time: DateTime.now(),
                  ),
                  CancelledCard(
                    name: 'Dr.Jenny Waston',
                    type: 1,
                    image: 'assets/images/doctor2.png',
                    time: DateTime.now(),
                  ),
                  CancelledCard(
                    name: 'Dr.Jenny Waston',
                    type: 2,
                    image: 'assets/images/doctor3.png',
                    time: DateTime.now(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
