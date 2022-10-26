import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';

class AudioMess extends StatefulWidget {
  final DateTime time;
  const AudioMess({super.key, required this.time});

  @override
  State<AudioMess> createState() => _AudioMessState();
}

class _AudioMessState extends State<AudioMess> with TickerProviderStateMixin {
  // late AnimationController controller;
  @override
  void initState() {
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.primaryColor.withOpacity(0.2),
        ),
        child: Row(
          children: [
            const Icon(Icons.play_circle, color: AppColors.primaryColor1),
            const SizedBox(width: 10),
            Expanded(
              // child: LinearProgressIndicator(
              //   value: controller.value,
              //   semanticsLabel: 'Linear progress indicator',
              // ),
              child: Container(
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    DateFormat().add_jm().format(widget.time),
                    style: const TextStyle(
                      color: AppColors.primaryColor1,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
                const Icon(
                  Icons.check,
                  size: 15,
                  color: AppColors.primaryColor1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
