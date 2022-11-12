import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/pop_up_men.dart';
import '../../../../constants/app_color.dart';
import '../../list_appointment_screen/screens/message_screeen.dart';

class CallRecordScreen extends StatelessWidget {
  CallRecordScreen({super.key});
  final arg = Get.arguments as int;
  RxInt startPlayVideo = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        actions: [
          PopUpMen(
            menuList: const [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.cloud_download,
                  ),
                  title: Text("DowLoad Record", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text("Delete Call Record",
                      style: TextStyle(color: Colors.red, fontSize: 14)),
                ),
              ),
            ],
            icon: Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: AppColors.textColor),
                color: AppColors.backgroudColor,
              ),
              child: const Icon(
                Icons.more_horiz,
                color: AppColors.textColor,
                size: 15,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/doctor2.png'),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dr. Minh Hung',
                      style: TextStyle(
                        color: AppColors.textColor,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Voice Call',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '${DateFormat().add_yMEd().format(DateTime.now())} | ${DateFormat().add_jm().format(DateTime.now())}',
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
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  child: const Icon(Icons.phone,
                      color: AppColors.primaryColor1, size: 20),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Divider(color: AppColors.textColor1),
                const SizedBox(height: 20.0),
                const Text(
                  '30 minutes of voice(video) calls have been recored',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20.0),
                arg == 0
                    ? Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.primaryColor,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10.0,
                                color: AppColors.textColor.withOpacity(0.3)),
                          ],
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/doctor3.png'),
                          ),
                        ),
                      ),
                const SizedBox(height: 20.0),
                Obx(
                  () => startPlayVideo.value == 0
                      ? InkWell(
                          onTap: () => startPlayVideo.value = 1,
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: AppColors.primaryColor1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Text(
                                  ' Play Call Recordings',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: AppColors.primaryColor
                                            .withOpacity(0.3),
                                      ),
                                      child: const Text(
                                        'Stop',
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: AppColors.primaryColor1),
                                      child: const Text(
                                        'Pause',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ))),
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
