import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../widgets/doctor_card.dart';

List<Map<String, dynamic>> listFavDoctor = [
  {'name': 'Nguyen Minh Hung', 'image': 'assets/images/doctor2.png'},
  {'name': 'Duc Hoang', 'image': 'assets/images/doctor3.png'},
];

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  RxInt selectTop = 0.obs;

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
        title: const Text(
          'My Favorite Doctor',
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
          const SizedBox(height: 20),
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
                  for (int i = 0; i < FakeData.topData.length; i++)
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
                            FakeData.topData[i],
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
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < listFavDoctor.length; i++)
            Dismissible(
              onDismissed: (dismiss) async {
                await showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (builder) => BottomRemove(i: i, func1: () {}),
                );
              },
              direction: DismissDirection.endToStart,
              background: Container(
                margin: const EdgeInsets.all(7),
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.delete,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
              ),
              key: ValueKey<int>(i),
              child: DoctorCard(
                name: listFavDoctor[i]['name'],
                image: listFavDoctor[i]['image'],
              ),
            ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class BottomRemove extends StatelessWidget {
  const BottomRemove({
    Key? key,
    required this.i,
    required this.func1,
  }) : super(key: key);

  final int i;
  final VoidCallback func1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
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
            'Remove  from Favorites',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor1),
          ),
          const SizedBox(height: 8.0),
          DoctorCard(
            name: listFavDoctor[i]['name'],
            image: listFavDoctor[i]['image'],
          ),
          const SizedBox(height: 10),
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
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: func1,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: AppColors.primaryColor,
                      ),
                      child: const Text(
                        'Yes, Remove',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
