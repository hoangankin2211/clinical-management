import 'package:clinic_manager/features/auth/binding/sign_in_binding.dart';
import 'package:clinic_manager/features/patient/dashboard/binding/dashboard_binding.dart';
import 'package:clinic_manager/features/patient/doctor_detail/binding/book_appointment_binding.dart';
import 'package:clinic_manager/features/patient/doctor_detail/binding/doctor_detail_binding.dart';
import 'package:clinic_manager/features/patient/doctor_detail/binding/view_review_binding.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/book_appointment_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/doctor_detail_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/enter_pin_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/patient_detail_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/payement_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/select_package_screen.dart';
import 'package:clinic_manager/features/patient/doctor_detail/screens/view_reviews_screen.dart';
import 'package:clinic_manager/features/patient/home/binding/favorite_binding.dart';
import 'package:clinic_manager/features/patient/home/screens/notification_screen.dart';
import 'package:clinic_manager/features/patient/my_appointment_detail_screen.dart/binding/my_appointment_detail_binding.dart';
import 'package:clinic_manager/features/patient/my_appointment_detail_screen.dart/screens/my_appointment_detail._screen.dart';
import 'package:clinic_manager/features/patient/reschedule_apponitment/screens/reason_schedule_change_screen.dart';
import 'package:clinic_manager/routes/route_name.dart';
import 'package:get/get.dart';

import '../features/auth/screens/sign_in_screen.dart';
import '../features/patient/dashboard/screens/dashboard_screen.dart';
import '../features/patient/doctor_detail/screens/review_sumary_screen.dart';
import '../features/patient/home/binding/notification_binding.dart';
import '../features/patient/home/binding/search_binding.dart';
import '../features/patient/home/screens/favorite_screen.dart';
import '../features/patient/home/screens/search_screen.dart';
import '../features/patient/reschedule_apponitment/binding/reason_schedule_change_binding.dart';
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
      page: () => FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: RouteNames.searchScreen,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RouteNames.doctorDetailScreen,
      page: () => DoctorDetailSceen(),
      binding: DoctorDetailBinding(),
    ),
    GetPage(
      name: RouteNames.viewReiviewScreen,
      page: () => ViewReviewScreen(),
      binding: ViewReviewBinding(),
    ),
    GetPage(
      name: RouteNames.bookAppointmentScreen,
      page: () => BookAppointmentScreen(),
      binding: BookAppointmentBinding(),
    ),
    GetPage(
      name: RouteNames.selectPackageScreen,
      page: () => SelectPackageScreen(),
    ),
    GetPage(
      name: RouteNames.patientDetailScreen,
      page: () => PatientDetailScsreen(),
    ),
    GetPage(
      name: RouteNames.payementScreen,
      page: () => PaymentScreen(),
    ),
    GetPage(
      name: RouteNames.reviewSumaryScreen,
      page: () => ReviewSummaryScreen(),
    ),
    GetPage(
      name: RouteNames.enterPinScreen,
      page: () => EnterPinSccreen(),
    ),
    GetPage(
      name: RouteNames.reasonScheduleChangeScreen,
      page: () => ReasonScheduleChagescreen(),
      binding: ReasonScheduleChangeBinding(),
    ),
    GetPage(
      name: RouteNames.myAppointmentDetailScreen,
      page: () => MyAppointmentDetailScreen(),
      binding: MyAppointmentDetailBinding(),
    ),
  ];
}
