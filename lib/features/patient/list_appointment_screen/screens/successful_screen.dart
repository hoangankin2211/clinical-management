import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroudColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: AppColors.textColor),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/Pattern Success.png',
                          color: AppColors.primaryColor),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor1,
                        ),
                        child: const Icon(
                          Icons.access_time_filled_sharp,
                          color: AppColors.backgroudColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'The consulation session has ended',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Recording have been saved in activity',
                    style: TextStyle(
                      color: AppColors.textColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: AppColors.textColor1),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/doctor2.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Dr. Drake Boeson',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Immunologists',
                    style: TextStyle(
                      color: AppColors.textColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'The Valley Hospital in California US',
                    style: TextStyle(
                      color: AppColors.textColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: AppColors.textColor1),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color:
                                      AppColors.primaryColor.withOpacity(0.3),
                                ),
                                child: const Text(
                                  'Back To Home',
                                  style: TextStyle(
                                      color: AppColors.primaryColor1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ))),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InkWell(
                            onTap: () =>
                                Get.toNamed(RouteNames.writeReviewScreen),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
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
            ),
          ],
        ));
  }
}
