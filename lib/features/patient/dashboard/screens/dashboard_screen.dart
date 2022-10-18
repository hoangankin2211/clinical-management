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

// class DashBoardScreen extends StatefulWidget {
//   const DashBoardScreen({super.key});

//   @override
//   State<DashBoardScreen> createState() => _DashBoardScreenState();
// }

// class _DashBoardScreenState extends State<DashBoardScreen> {
//   // late IO.Socket socket;
//   RxInt _counter = 0.obs;
//   // int _counter = 0;
//   final socket = SocketServices().socketClient;
//   // void connect() {
//   //   // ignore: avoid_print
//   //   print("Connecting socket");
//   //   socket = IO.io(ApiLink.uri, <String, dynamic>{
//   //     'transports': ['websocket'],
//   //     'autoConnect': false,
//   //   });
//   //   socket.connect();
//   //   socket.onConnect((data) => {print("Connected")});
//   //   // ignore: avoid_print
//   //   print("connect socket: ${socket.connected}");
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // connect();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final User _user = AuthService.instance.user;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => AuthService.instance.logOut(context),
//         child: const Icon(Icons.add),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(
//               () => Text(
//                 _counter.value.toString(),
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             CustomButton(
//                 text: 'Counter',
//                 onTap: () => {
//                       socket.emit('fromClient', _counter.value),
//                       socket.on('fromServer', (data) {
//                         _counter.value = int.parse(data);
//                       })
//                     })
//           ],
//         ),
//       ),
//     );
//   }
// }
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
          body: _controller.pages[_controller.page.value],
        ));
  }
}
