import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
              Colors.blue,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/doctor2.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: AppColors.textColor.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dr. Drake Sollean',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            const SizedBox(height: 10),
            const Text(
              '16:25 mins',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 170,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: AppColors.textColor.withOpacity(0.3),
                    ),
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/doctor3.png',
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.grey.withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: const Icon(Icons.volume_up, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.grey.withOpacity(0.4),
                          ],
                        ),
                      ),
                      child:
                          const Icon(Icons.videocam_sharp, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.grey.withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: const Icon(Icons.mic, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.withOpacity(0.9),
                      ),
                      child: const Icon(Icons.mic, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
