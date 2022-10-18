import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          const SizedBox(height: 10),
          _searchView(),
          const SizedBox(height: 20),
          _checkHealthView(),
          const SizedBox(height: 20),
          _row(header1: 'Doctor Speciality', header2: 'See More'),
        ],
      ),
    );
  }

  Padding _row({required String header1, required String header2}) {
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
            onTap: () {},
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/facebook.png'),
              ),
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
            onTap: () {},
            child: SvgPicture.asset('assets/icons/Notification.svg'),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}
