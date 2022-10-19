import 'package:clinic_manager/features/patient/home/controller/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
