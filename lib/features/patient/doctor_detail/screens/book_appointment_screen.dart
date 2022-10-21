import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

List<List<String>> timeMeeting = [
  [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
  ],
  [
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ],
  [
    '15:00 PM',
    '15:30 PM',
    '16:00 PM',
  ],
  [
    '16:30 PM',
    '17:00 PM',
    '17:30 PM',
  ]
];

class BookAppointmentScreen extends StatelessWidget {
  BookAppointmentScreen({super.key});
  Rx<CalendarFormat> format = CalendarFormat.month.obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<String> select = ''.obs;
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
          'Book Appointment',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Select Date',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Obx(
            () => _calenderField(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Select Hour',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  for (int i = 0; i < 4; i++)
                    Row(
                      children: [
                        for (int j = 0; j < 3; j++)
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => select.value = timeMeeting[i][j],
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: (select.value == timeMeeting[i][j])
                                        ? AppColors.primaryColor1
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 2,
                                        color: AppColors.primaryColor)),
                                child: Text(
                                  timeMeeting[i][j],
                                  style: TextStyle(
                                    color: (select.value == timeMeeting[i][j])
                                        ? Colors.white
                                        : AppColors.primaryColor1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () => Get.toNamed(RouteNames.selectPackageScreen),
                text: 'Next',
              )),
          // InkWell(
          //   borderRadius: BorderRadius.circular(20.0),
          //   onTap: () {},
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 20.0),
          //     alignment: Alignment.center,
          //     width: double.infinity,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20.0),
          //       color: AppColors.primaryColor1.withOpacity(0.6),
          //       // boxShadow: [
          //       //   BoxShadow(
          //       //     color: AppColors.textColor.withOpacity(0.7),
          //       //     blurRadius: 10.0,
          //       //     offset: const Offset(5.0, 5.0),
          //       //   )
          //       // ],
          //     ),
          //     child: const Text(
          //       'Next',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container _calenderField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryColor.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.02),
            blurRadius: 10.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: TableCalendar(
        focusedDay: selectedDay.value,
        firstDay: DateTime(1990),
        lastDay: DateTime(2050),
        rowHeight: 40.0,
        calendarFormat: format.value,
        onFormatChanged: (CalendarFormat _format) {
          format.value = _format;
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          // setState(() {
          selectedDay.value = selectDay;
          focusedDay.value = focusDay;
          // });
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(selectedDay.value, date);
        },

        calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: AppColors.primaryColor1,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            markerDecoration: const BoxDecoration(
                color: AppColors.primaryColor2, shape: BoxShape.circle),
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            todayDecoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0)),
            weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0)),
            todayTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            weekendTextStyle: const TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            defaultTextStyle: const TextStyle(color: AppColors.textColor)),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
        headerStyle: HeaderStyle(
          leftChevronIcon:
              const Icon(Icons.chevron_left, color: AppColors.textColor),
          rightChevronIcon:
              const Icon(Icons.chevron_right, color: AppColors.textColor),
          titleTextStyle: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
          formatButtonVisible: true,
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5.0)),
          formatButtonTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // daysOfWeekStyle: TextStyle(),
      ),
    );
  }
}
