import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/common/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_icon.dart';
import '../../../constants/app_color.dart';
import '../../../routes/route_name.dart';
import '../widgets/main_page_view_intro.dart';

PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    List<Widget> listViewIntro = [
      MainPageViewIntro(
          heightDevice: heightDevice,
          gifPath: 'assets/images/intro1.png',
          mainTitle: 'Thanh toán online',
          title:
              'Bạn không còn gặp khó khăn với các phương thức thanh toán tiền mặt vì đã có thể thanh  toán online qua zalo pay'),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro2.png',
        mainTitle: 'Lên lịch hẹn',
        title:
            'Không còn phải khó xử khi chọn giữa công việc và buổi hẹn với bác sĩ, nay bạn đã có thể chủ động lên lịch hẹn một cách chủ động.',
      ),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro3.png',
        mainTitle: 'Tư vấn trực tiếp',
        title:
            'Nhắn tin trự tiếp với bác sĩ tư vấn về các vấn đề bạn gặp phải.',
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomHeader(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewIntro.length,
                    itemBuilder: (context, index) => buildIndicator(
                        _currentIndex == index, MediaQuery.of(context).size),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Bỏ qua',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return listViewIntro[index];
                },
                itemCount: listViewIntro.length,
              ),
            ),
            CustomButton(
                text: (_currentIndex == 2) ? 'Bắt Đầu' : 'Tiếp tục',
                onTap: () {
                  setState(() {
                    if (_currentIndex == 0) {
                      onButtonTape(1);
                    } else if (_currentIndex == 1) {
                      onButtonTape(2);
                    } else {
                      Get.toNamed(RouteNames.signInScreen);
                    }
                  });
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //container with border
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ],
      ),
    );
  }
}
