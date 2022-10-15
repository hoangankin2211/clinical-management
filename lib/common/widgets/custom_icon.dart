import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomIcon extends StatelessWidget {
  final double size;
  const CustomIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withOpacity(0.2)),
      child: Image.asset(
        'assets/images/app_icon.png',
        height: size,
        width: size,
        color: AppColors.primaryColor,
      ),
    );
  }
}
