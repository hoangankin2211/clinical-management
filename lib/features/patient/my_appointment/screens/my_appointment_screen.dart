import 'package:clinic_manager/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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

class UpcomingCard extends StatelessWidget {
  final String name;
  final String image;
  final int type;
  final DateTime time;

  const UpcomingCard({
    Key? key,
    required this.name,
    required this.image,
    required this.type,
    required this.time,
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
    return Container(
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
                    height: 30.0, width: 30.0, color: AppColors.primaryColor1),
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
                    onTap: () {},
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
                    onTap: () {},
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
    );
  }
}

class CompletedCard extends StatelessWidget {
  final String name;
  final String image;
  final int type;
  final DateTime time;

  const CompletedCard({
    Key? key,
    required this.name,
    required this.image,
    required this.type,
    required this.time,
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
    return Container(
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
                            border: Border.all(width: 1, color: Colors.green),
                          ),
                          child: const Text(
                            'Upcoming',
                            style: TextStyle(
                              color: Colors.green,
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
                    height: 30.0, width: 30.0, color: AppColors.primaryColor1),
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
                    onTap: () {},
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
                          'Book Again',
                          style: TextStyle(
                              color: AppColors.primaryColor1,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ))),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColors.primaryColor1),
                        child: const Text(
                          'Leave a Review',
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
    );
  }
}

class CancelledCard extends StatelessWidget {
  final String name;
  final String image;
  final int type;
  final DateTime time;

  const CancelledCard({
    Key? key,
    required this.name,
    required this.image,
    required this.type,
    required this.time,
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
    return Container(
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
                            border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: const Text(
                            'Upcoming',
                            style: TextStyle(
                              color: Colors.red,
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
                    height: 30.0, width: 30.0, color: AppColors.primaryColor1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
