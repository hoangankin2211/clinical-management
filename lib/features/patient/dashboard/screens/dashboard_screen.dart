import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/constants/api_link.dart';
import 'package:clinic_manager/features/patient/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../models/user.dart';
import '../../../../services/auth_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../services/socket_services.dart';

class DashBoardScreen extends StatelessWidget {
  final _controller = Get.find<DashboardController>();
  DashBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _controller.page.value,
            selectedItemColor: AppColors.primaryColor,
            backgroundColor: AppColors.backgroudColor,
            iconSize: 20,
            onTap: _controller.updatePage,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Home.svg',
                        color: _controller.page.value == 0
                            ? AppColors.primaryColor
                            : AppColors.textColor1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: _controller.page.value == 0
                              ? AppColors.primaryColor
                              : AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Calendar.svg',
                        color: _controller.page.value == 1
                            ? AppColors.primaryColor
                            : AppColors.textColor1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Appointment',
                        style: TextStyle(
                          color: _controller.page.value == 1
                              ? AppColors.primaryColor
                              : AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Document.svg',
                        color: _controller.page.value == 2
                            ? AppColors.primaryColor
                            : AppColors.textColor1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'History',
                        style: TextStyle(
                          color: _controller.page.value == 2
                              ? AppColors.primaryColor
                              : AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Graph.svg',
                        color: _controller.page.value == 3
                            ? AppColors.primaryColor
                            : AppColors.textColor1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Articles',
                        style: TextStyle(
                          color: _controller.page.value == 3
                              ? AppColors.primaryColor
                              : AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        color: _controller.page.value == 4
                            ? AppColors.primaryColor
                            : AppColors.textColor1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: _controller.page.value == 4
                              ? AppColors.primaryColor
                              : AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: IndexedStack(
              index: _controller.page.value, children: _controller.pages),
        ));
  }
}
