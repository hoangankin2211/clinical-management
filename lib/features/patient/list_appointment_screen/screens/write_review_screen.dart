import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

class WriteReviewScreen extends StatelessWidget {
  WriteReviewScreen({super.key});
  final TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    RxInt _value = 0.obs;
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Write a Review',
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
          const SizedBox(height: 10),
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
          const SizedBox(height: 20),
          const Text(
            'How was your experience\nwith Dr.Drake Boeson?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.center,
            child: RatingBar.builder(
              itemSize: 35.0,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              unratedColor: AppColors.primaryColor.withOpacity(0.4),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColors.primaryColor1,
              ),
              onRatingUpdate: (rating) {},
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: AppColors.textColor1),
                const SizedBox(height: 10.0),
                const Text(
                  'Write Your Reiview',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextField1(
                  controller: reviewController,
                  hintText: 'Your review here...',
                  maxLines: 6,
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'Would you recommend Dr.Drake Boeson to your friends?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5.0),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _value.value,
                            onChanged: (value) {
                              _value.value = value!;
                            },
                            activeColor: AppColors.primaryColor1,
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _value.value,
                            onChanged: (value) {
                              _value.value = value!;
                            },
                            activeColor: AppColors.primaryColor1,
                          ),
                          const Text(
                            'No',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
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
                                color: AppColors.primaryColor.withOpacity(0.3),
                              ),
                              child: const Text(
                                'Cancel',
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: AppColors.primaryColor1),
                              child: const Text(
                                'Submit',
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
          )
        ],
      ),
    );
  }
}
