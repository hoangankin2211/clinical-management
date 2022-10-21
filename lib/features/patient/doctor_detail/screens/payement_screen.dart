import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';

//google_pay
//pay_pal
//apple
List<Map<String, dynamic>> listPay = [
  {'image': 'assets/icons/google_pay.svg', 'title': 'Google Pay'},
  {'image': 'assets/icons/zalopay.svg', 'title': 'Zalo Pay'},
  {'image': 'assets/icons/apple.svg', 'title': 'Apple Pay'},
];

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  RxInt select = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Payments',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child:
                const Icon(Icons.qr_code_scanner, color: AppColors.textColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Select the payment method you want to use',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Obx(
            () => Column(
              children: [
                for (int i = 0; i < listPay.length; i++)
                  PaymentCard(
                    image: listPay[i]['image'],
                    title: listPay[i]['title'],
                    check: i == select.value,
                    press: () => select.value = i,
                  )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
              child: const Text(
                'Add New Card',
                style: TextStyle(
                    color: AppColors.primaryColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () => Get.toNamed(RouteNames.reviewSumaryScreen),
                text: 'Next',
              )),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.image,
    required this.title,
    required this.check,
    required this.press,
  }) : super(key: key);

  final String image;
  final String title;
  final bool check;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 40,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 18,
              width: 18,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 2, color: AppColors.primaryColor1)),
              child: Container(
                // height: 20,
                // width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: check ? AppColors.primaryColor1 : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
