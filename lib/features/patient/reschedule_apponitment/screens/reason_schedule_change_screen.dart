import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

List<String> titles = [
  'I\'m having a schedule clash',
  'I\'m not available on schedule',
  'I have a activity that can\'t be left behind',
  'I don\'t want to tell',
  'Others',
];

class ReasonScheduleChagescreen extends StatefulWidget {
  ReasonScheduleChagescreen({super.key});

  @override
  State<ReasonScheduleChagescreen> createState() =>
      _ReasonScheduleChagescreenState();
}

class _ReasonScheduleChagescreenState extends State<ReasonScheduleChagescreen> {
  RxList<int> selects = <int>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: 'Next',
            onTap: () => Get.toNamed(RouteNames.bookAppointmentScreen,
                arguments: 'Reschedule Appointment'),
          )),
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Reschedule Appointment',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Reason of Schedule Change',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Column(
              children: [
                for (int i = 0; i < titles.length; i++)
                  RowReason(
                    check: selects.value.contains(i),
                    title: titles[i],
                    press: () {
                      selects.value.contains(i)
                          ? selects.value.remove(i)
                          : selects.value.add(i);
                      setState(() {});
                    },
                  )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: AppColors.backgroudColor.withOpacity(0.95),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 10.0,
                  offset: const Offset(5.0, 5.0),
                ),
              ],
            ),
            child: const Text(
              'Lorem ipsum dolor sit amet, consecteur adipiscing elit. sed do eisumod tempor incididunt ut labore et dolore manga aliqua. Ut enim ad  minim veniam, quis nostrud exercitation ulamco laboris nisi ut aliquip ex ea commodo consequet. Duis aute irure dolor in reprehender in vlupate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowReason extends StatelessWidget {
  final bool check;
  final String title;
  final Function() press;
  const RowReason({
    Key? key,
    required this.check,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          InkWell(
            onTap: press,
            child: Container(
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
                    color: check ? AppColors.primaryColor1 : Colors.white),
              ),
            ),
          ),
          Text(
            '  $title',
            style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
