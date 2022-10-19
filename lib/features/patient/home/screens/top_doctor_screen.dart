import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../widgets/doctor_card.dart';

List<Map<String, dynamic>> listFavDoctor = [
  {'name': 'Nguyen Minh Hung', 'image': 'assets/images/doctor2.png'},
  {'name': 'Duc Hoang', 'image': 'assets/images/doctor3.png'},
];

class TopDoctorScreen extends StatelessWidget {
  TopDoctorScreen({super.key});
  RxInt selectTop = 0.obs;

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
        title: const Text(
          'Top Doctor',
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
            DoctorCard(
              name: listFavDoctor[i]['name'],
              image: listFavDoctor[i]['image'],
            ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
