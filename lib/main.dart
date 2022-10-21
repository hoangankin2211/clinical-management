import 'package:clinic_manager/features/splash_intro/screens/intro_screen.dart';
import 'package:clinic_manager/routes/app_pages.dart';
import 'package:clinic_manager/routes/route_name.dart';
import 'package:clinic_manager/services/start_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/splash_intro/screens/splash_screen.dart';
import 'package:calendar_view/calendar_view.dart';

late SharedPreferences sharedPreferencesOfApp;

Future initSharePreference() async {
  sharedPreferencesOfApp = await SharedPreferences.getInstance();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharePreference();
  StartService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          // fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RouteNames.splashScreen,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
