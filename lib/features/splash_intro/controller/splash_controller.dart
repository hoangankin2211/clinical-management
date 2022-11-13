import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../../services/auth_services.dart';
import '../../../services/data_services.dart';

class SplashC extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // await Future.delayed(const Duration(seconds: 5), () async {
    //   gotoNextScreen();
    // });
    bool check = await AuthService.instance.getUserData();
    if (check) {
      // bool check1 = await DataService.instance.fetchAllData();
      // if (check1) {
      Get.offAllNamed(RouteNames.dashboardScreen);
      // }
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
