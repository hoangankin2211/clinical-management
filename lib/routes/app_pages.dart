import 'package:clinic_manager/features/auth/binding/sign_in_binding.dart';
import 'package:clinic_manager/routes/route_name.dart';
import 'package:get/get.dart';

import '../features/auth/screens/sign_in_screen.dart';
import '../features/splash_intro/screens/intro_screen.dart';
import '../features/splash_intro/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
      // binding: SplashB(),
    ),
    GetPage(
      name: RouteNames.introScreen,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: RouteNames.signInScreen,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
  ];
}
