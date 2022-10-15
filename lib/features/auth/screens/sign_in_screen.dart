import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/common/widgets/custom_header.dart';
import 'package:clinic_manager/common/widgets/custom_password_field.dart';
import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_background.dart';
import '../../../common/widgets/custom_circle_button.dart';
import '../../../constants/app_color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // var heightDevice = MediaQuery.of(context).size.height;
    // var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomHeader(),
      ),
      backgroundColor: AppColors.primaryColor2,
      body: CustomBackground(
        percent: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 80,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor.withOpacity(0.4),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                icon: Icons.email,
              ),
              const SizedBox(height: 10),
              const Text(
                'Password',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomPasswordField(
                controller: emailController,
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              Row(
                children: [
                  Checkbox(
                    // splashRadius: 2.0,
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith((states) =>
                        isChecked
                            ? AppColors.primaryColor
                            : AppColors.textColor1),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    'Stay logged in?',
                    style: TextStyle(color: AppColors.textColor1, fontSize: 12),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(text: "Log In", onTap: () {}),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account yet? Register ',
                    style: TextStyle(
                      color: AppColors.textColor1,
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print(1);
                    },
                    child: const Text(
                      'here',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100, height: 0.7, color: AppColors.textColor1),
                  const Text(' Or login with ',
                      style:
                          TextStyle(color: AppColors.textColor1, fontSize: 14)),
                  Container(
                      width: 100, height: 0.7, color: AppColors.textColor1),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(image: 'assets/images/gmail.png', press: () {}),
                  const SizedBox(width: 20),
                  CircleButton(
                      image: 'assets/images/facebook.png', press: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
