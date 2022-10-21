import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset('assets/images/app_icon.png',
              color: AppColors.primaryColor),
        ),
        const SizedBox(width: 5),
        RichText(
          text: const TextSpan(
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 14),
            children: [
              TextSpan(
                  text: 'Xin Chào, Chúng tôi là ',
                  style: TextStyle(
                      fontFamily: 'Montserrat', color: AppColors.textColor)),
              TextSpan(
                text: 'Climanage',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ],
    );
  }
}
