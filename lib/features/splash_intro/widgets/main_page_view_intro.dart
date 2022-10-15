import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class MainPageViewIntro extends StatelessWidget {
  final String gifPath;
  final String mainTitle;
  final String title;
  const MainPageViewIntro({
    Key? key,
    required this.heightDevice,
    required this.gifPath,
    required this.mainTitle,
    required this.title,
  }) : super(key: key);

  final double heightDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(gifPath),
            ),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainTitle,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textColor1,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
      ],
    );
  }
}
