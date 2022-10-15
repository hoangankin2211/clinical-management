import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int maxLines;
  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.labelText,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool checkShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: checkShow,
      controller: widget.controller,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
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
          child: InkWell(
            onTap: () {
              setState(() {
                checkShow = !checkShow;
              });
            },
            child: Icon(
              (checkShow) ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
      maxLines: widget.maxLines,
    );
  }
}
