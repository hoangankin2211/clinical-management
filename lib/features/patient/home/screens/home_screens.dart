import 'package:clinic_manager/constants/fake_data.dart';
import 'package:clinic_manager/features/patient/home/screens/top_doctor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';
import '../widgets/doctor_card.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

List<Map<String, dynamic>> fakeItem = [
  {
    'image': 'assets/icons/people.svg',
    'name': 'General',
  },
  {
    'image': 'assets/icons/dentist.svg',
    'name': 'Dentist',
  },
  {
    'image': 'assets/icons/eye.svg',
    'name': 'Ophthal',
  },
  {
    'image': 'assets/icons/nutritionist.svg',
    'name': 'Nutritionist',
  },
  {
    'image': 'assets/icons/neurole.svg',
    'name': 'Neurole',
  },
  {
    'image': 'assets/icons/bediatric.svg',
    'name': 'Pediatric',
  },
  {
    'image': 'assets/icons/radiology.svg',
    'name': 'Radiology',
  },
  {
    'image': 'assets/icons/more.svg',
    'name': 'More',
  },
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt selectTop = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.05),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          _headerView(),
          const SizedBox(height: 5),
          _searchView(),
          const SizedBox(height: 20),
          _checkHealthView(),
          const SizedBox(height: 20),
          _row(
              header1: 'Doctor Speciality',
              header2: 'See More',
              context: context),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                // const SizedBox(width: 10),
                ...fakeItem.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor.withOpacity(0.1),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(e['image'],
                                height: 30,
                                width: 30,
                                color: AppColors.primaryColor1),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            e['name'],
                            style: const TextStyle(
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          _row(header1: 'Top Doctor', header2: 'See All', context: context),
          const SizedBox(height: 15),
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
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: const [
              DoctorCard(
                name: 'Dr. Minh Hung',
                image: 'assets/images/doctor2.png',
              ),
              DoctorCard(
                name: 'Dr. Duc Hoang',
                image: 'assets/images/doctor3.png',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }

  Padding _row(
      {required String header1,
      required String header2,
      required BuildContext context}) {
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
            onTap: () async => await showMaterialModalBottomSheet(
              context: context,
              builder: (context) => TopDoctorScreen(),
            ),
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

  Container _checkHealthView() {
    return Container(
      width: double.infinity,
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.3),
            blurRadius: 10.0,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/doctor1.png',
              height: 160,
            ),
          ),
          SizedBox(
            width: 260,
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medicals Checks',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Check your health condition regualarly to minimize the incidence of disease in the future',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.backgroudColor,
                      ),
                      child: const Text(
                        'Check Now',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _searchView() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textColor1.withOpacity(0.1),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/Search.svg',
              color: AppColors.textColor1),
          const SizedBox(width: 10),
          Expanded(
              child: TextFormField(
            onFieldSubmitted: (stringQuery) =>
                Get.toNamed(RouteNames.searchScreen, arguments: stringQuery),
            decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: AppColors.textColor1),
              border: InputBorder.none,
            ),
          )),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/Filter.svg',
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }

  Padding _headerView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/doctor2.png'),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: AppColors.textColor.withOpacity(0.2),
                  offset: const Offset(2, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good Morning',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              Text(
                'Nguyen Minh Hung',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => Get.toNamed(RouteNames.notificationScreen),
            child: SvgPicture.asset('assets/icons/Notification.svg'),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => Get.toNamed(RouteNames.favoriteScreen),
            child: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}
