import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int maxLines;
  final IconData icon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        labelText: labelText,
        hintText: hintText,
        focusColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        // fillColor: GlobalVariables.secondaryColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.textColor1,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          child: Icon(icon),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
