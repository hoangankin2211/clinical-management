import 'package:clinic_manager/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/fake_data.dart';
import '../../../../routes/route_name.dart';
import '../widgets/doctor_card.dart';

List<Map<String, dynamic>> listFavDoctor = [
  {'name': 'Nguyen Minh Hung', 'image': 'assets/images/doctor2.png'},
  {'name': 'Duc Hoang', 'image': 'assets/images/doctor3.png'},
];

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  RxInt selectTop = 0.obs;
  final String searchString = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back,
                          color: AppColors.textColor)),
                  const SizedBox(width: 5),
                  Expanded(
                    child: _searchView(context),
                  ),
                ],
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchString != '' ? '20 found' : '0 found',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        'Default ',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.swap_vert, color: AppColors.primaryColor)
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          searchString != ''
              ? Column(children: [
                  for (int i = 0; i < listFavDoctor.length; i++)
                    DoctorCard(
                      name: listFavDoctor[i]['name'],
                      image: listFavDoctor[i]['image'],
                    ),
                ])
              : Container(),
        ],
      ),
    );
  }

  Container _searchView(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
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
            onTap: () async {
              await showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (builder) => BottomFilter(),
              );
            },
            child: SvgPicture.asset('assets/icons/Filter.svg',
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}

class BottomFilter extends StatelessWidget {
  const BottomFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
            'Filter',
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
        ],
      ),
    );
  }
}
