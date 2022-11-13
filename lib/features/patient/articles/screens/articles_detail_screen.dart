import 'package:clinic_manager/features/patient/doctor_detail/screens/doctor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';

class ArticlesDetailScreen extends StatelessWidget {
  final Map<String, dynamic> arg;
  const ArticlesDetailScreen({super.key, required this.arg});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.backgroudColor,
        actions: [
          InkWell(
            onTap: () async {},
            child: const Icon(Icons.bookmarks_outlined,
                color: AppColors.textColor),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.send, color: AppColors.textColor),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_horiz, color: AppColors.textColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  arg['image'],
                ),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: const Offset(5.0, 5.0),
                  color: AppColors.textColor.withOpacity(0.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  arg['mainTitle'],
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat().add_yMd().format(DateTime.now()),
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                      child: Text(
                        FakeData.articles[arg['type']],
                        style: const TextStyle(
                            color: AppColors.primaryColor1, fontSize: 12),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.remove_red_eye,
                        color: AppColors.primaryColor, size: 19),
                    const Text(
                      ' 4.6k',
                      style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(color: AppColors.textColor1),
                const SizedBox(height: 10.0),
                Text(arg['title']),
                const SizedBox(height: 10.0),
                const Divider(color: AppColors.textColor1),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 30.0,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: AppColors.primaryColor.withOpacity(0.4),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.primaryColor1,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
                        '200k Reviews',
                        style: TextStyle(
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Author',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          // const DoctorCard1(
          //     image: 'assets/images/doctor2.png',
          //     name: "Dr.Minh Hung",
          //     title1: "An Khe Hospital",
          //     title2: "Doctor"),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
