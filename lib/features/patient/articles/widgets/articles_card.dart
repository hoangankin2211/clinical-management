import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';

class ArticlesCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ArticlesCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(item['image']),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.2),
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat().add_yMd().format(DateTime.now()),
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 11,
                  ),
                ),
                Text(
                  item['mainTitle'],
                  maxLines: 3,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  child: Text(
                    FakeData.articles[item['type']],
                    style: const TextStyle(
                        color: AppColors.primaryColor1, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
