import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    Key? key,
    required this.percent,
    required this.child,
  }) : super(key: key);

  final double percent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: widthDevice,
          height: heightDevice,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor2,
          ),
        ),
        SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: heightDevice * (1 - percent),
                      child: Row(children: [
                        Image.asset(
                          'assets/images/hospital.png',
                          height: 100,
                          width: 100,
                        ),
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: heightDevice * percent),
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroudColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20.0,
                              offset: const Offset(-10, -10),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
