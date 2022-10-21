import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CircleButton extends StatelessWidget {
  final String image;
  final Function() press;
  const CircleButton({super.key, required this.image, required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroudColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(-4, 4),
            ),
          ],
        ),
        child: Image.asset(image, height: 20, width: 20),
      ),
    );
  }
}
