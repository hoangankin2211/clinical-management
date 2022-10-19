import 'package:clinic_manager/features/auth/binding/sign_in_binding.dart';
import 'package:clinic_manager/features/patient/dashboard/binding/dashboard_binding.dart';
import 'package:clinic_manager/features/patient/home/binding/favorite_binding.dart';
import 'package:clinic_manager/features/patient/home/screens/notification_screen.dart';
import 'package:clinic_manager/routes/route_name.dart';
import 'package:get/get.dart';

import '../features/auth/screens/sign_in_screen.dart';
import '../features/patient/dashboard/screens/dashboard_screen.dart';
import '../features/patient/home/binding/notification_binding.dart';
import '../features/patient/home/screens/favorite_screen.dart';
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
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: RouteNames.dashboardScreen,
      page: () => DashBoardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteNames.notificationScreen,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: RouteNames.favoriteScreen,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
  ];
}
