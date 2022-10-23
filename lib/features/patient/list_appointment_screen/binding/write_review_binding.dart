import 'package:clinic_manager/features/patient/list_appointment_screen/controller/write_review_controller.dart';
import 'package:get/get.dart';

class WriteReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteReviewController>(() => WriteReviewController());
  }
}
