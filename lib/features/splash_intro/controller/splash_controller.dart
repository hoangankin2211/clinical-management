import 'package:get/get.dart';

import '../../../routes/route_name.dart';

class SplashC extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5), () async {
      gotoNextScreen();
    });
  }

  Future<void> gotoNextScreen() async {
    Get.offAllNamed(RouteNames.introScreen);
  }
}
