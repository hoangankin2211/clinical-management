import 'package:clinic_manager/features/patient/articles/screens/articles_detail_screen.dart';
import 'package:clinic_manager/features/patient/articles/screens/my_bookmark_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../widgets/articles_card.dart';

class ArticlesMainScreen extends StatelessWidget {
  ArticlesMainScreen({super.key});
  RxInt selectTop = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/experiences.svg',
              color: AppColors.primaryColor1,
              height: 35,
              width: 35,
            ),
            const Text(
              ' Articles',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () async {},
            child: const Icon(Icons.search, color: AppColors.textColor),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () => Get.to(MyBookMarkScreen()),
            child:
                const Icon(Icons.bookmarks_rounded, color: AppColors.textColor),
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
          _row(
            header1: "Trending",
            header2: "See all",
            context: context,
            func: () {},
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 215,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                ...FakeData.fakeDataArticles.map((e) => InkWell(
                    onTap: () => Get.to(ArticlesDetailScreen(arg: e)),
                    child: TrendingArticle(item: e))),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          _row(
            header1: "Articles",
            header2: "See All",
            context: context,
            func: () async => await showMaterialModalBottomSheet(
              context: context,
              builder: (context) => AlticlesSeemore(),
            ),
          ),
          const SizedBox(height: 10.0),
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
                  for (int i = 0; i < FakeData.articles.length; i++)
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
                          child: Text(
                            FakeData.articles[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: (i == selectTop.value)
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ...FakeData.fakeDataArticles.map((e) => ArticlesCard(item: e)),
        ],
      ),
    );
  }

  Padding _row(
      {required String header1,
      required String header2,
      required BuildContext context,
      required VoidCallback func}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header1,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: func,
            child: Text(
              header2,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AlticlesSeemore extends StatelessWidget {
  AlticlesSeemore({
    Key? key,
  }) : super(key: key);
  RxInt selectTop = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          'Articles',
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
          const SizedBox(height: 10.0),
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
                  for (int i = 0; i < FakeData.articles.length; i++)
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
                          child: Text(
                            FakeData.articles[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: (i == selectTop.value)
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ...FakeData.fakeDataArticles.map((e) => ArticlesCard(item: e)),
        ],
      ),
    );
  }
}

class TrendingArticle extends StatelessWidget {
  final Map<String, dynamic> item;
  const TrendingArticle({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 270,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    item['image'],
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textColor.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: const Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              item['mainTitle'],
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.person,
                    color: AppColors.primaryColor1, size: 20),
                Text(
                  '${item['readers']}k (Readers)',
                  style: const TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(width: 10.0),
                const Icon(Icons.star,
                    color: AppColors.primaryColor1, size: 20),
                Text(
                  item['like'].toString(),
                  style: const TextStyle(
                      color: AppColors.textColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
