import 'package:clinic_manager/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../routes/route_name.dart';
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
                    cancelled: () async {
                      await showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (builder) => BottomCancelled(),
                      );
                    },
                  ),
                  UpcomingCard(
                    name: 'Dr.Jenny Waston',
                    type: 1,
                    image: 'assets/images/doctor2.png',
                    time: DateTime.now(),
                    cancelled: () {},
                  ),
                  UpcomingCard(
                    name: 'Dr.Jenny Waston',
                    type: 2,
                    image: 'assets/images/doctor3.png',
                    time: DateTime.now(),
                    cancelled: () {},
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

class BottomCancelled extends StatelessWidget {
  const BottomCancelled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.textColor1.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cancel Appointment',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text('Are you sure you want to cancel your appointment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  'Only 50% of the funs will be returned to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () => Get.toNamed(
                        RouteNames.reasonScheduleChangeScreen,
                        arguments: "Cancel Appointment"),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: AppColors.primaryColor,
                      ),
                      child: const Text(
                        'Yes, Remove',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
