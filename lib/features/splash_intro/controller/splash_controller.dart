import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../../services/auth_services.dart';

class SplashC extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // await Future.delayed(const Duration(seconds: 5), () async {
    //   gotoNextScreen();
    // });
    bool check = await AuthService.instance.getUserData();
    if (check) {
      Get.offAllNamed(RouteNames.dashboardScreen);
    } else {
      Get.offAllNamed(RouteNames.introScreen);
    }
  }

  Future<void> gotoNextScreen() async {
    if (AuthService.instance.isLogin) {
      Get.offAllNamed(RouteNames.dashboardScreen);
    } else {
      Get.offAllNamed(RouteNames.introScreen);
    }
  }
}
