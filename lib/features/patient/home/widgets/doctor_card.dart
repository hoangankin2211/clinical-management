import 'package:clinic_manager/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  const DoctorCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteNames.doctorDetailScreen),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.backgroudColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Row(
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
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Icon(Icons.favorite,
                          color: AppColors.primaryColor, size: 18),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Divider(color: AppColors.textColor1),
                  const SizedBox(height: 2),
                  RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      style:
                          TextStyle(color: AppColors.textColor1, fontSize: 13),
                      children: [
                        TextSpan(text: 'Dentist | '),
                        TextSpan(text: 'Alka Hospital'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.star, color: AppColors.primaryColor, size: 15),
                      Text(
                        ' 4.3 (5.376 reviews)',
                        style:
                            TextStyle(color: AppColors.textColor, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
