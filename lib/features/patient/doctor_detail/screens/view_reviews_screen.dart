import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../../profile_settings/widgets/bottom_log_out.dart';
import '../widgets/comment_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewReviewScreen extends StatelessWidget {
  ViewReviewScreen({super.key});
  RxInt selectTop = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder) => BottomAddReviews(),
          );
        },
        child:
            const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.white),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          '4.8 (4.942 reviews)',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {},
            child: const Icon(Icons.search, color: AppColors.textColor),
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
            const SizedBox(height: 10),
            Obx(
              () => SizedBox(
                height: 30,
                width: double.infinity,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 10),
                    for (int i = 0; i < FakeData.rating.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            selectTop.value = i;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (i == selectTop.value)
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    width: 1, color: AppColors.primaryColor)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: (i == selectTop.value)
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  FakeData.rating[i] == 6
                                      ? 'All'
                                      : FakeData.rating[i].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: (i == selectTop.value)
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CommentCard(
              name: 'Charolette Hanlin',
              image: 'assets/images/doctor3.png',
              favCount: 629,
              title:
                  'Dr.Jenny is very professional in her work and responsive. I have consulted and my problem is solved.',
              day: 6,
              star: 4,
              checkLike: true,
            ),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/doctor2.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
            ),
            const CommentCard(
              name: 'Charolette Hanlin',
              image: 'assets/images/doctor3.png',
              favCount: 629,
              title:
                  'Dr.Jenny is very professional in her work and responsive. I have consulted and my problem is solved.',
              day: 6,
              star: 4,
              checkLike: true,
            ),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/doctor2.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
            ),
          ]),
    );
  }
}

class BottomAddReviews extends StatelessWidget {
  BottomAddReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      // padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.textColor1.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Log Out',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text('Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
