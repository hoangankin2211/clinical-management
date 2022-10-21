import 'package:clinic_manager/features/patient/doctor_detail/controller/view_review_controller.dart';
import 'package:get/get.dart';

class ViewReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewReviewsController>(() => ViewReviewsController());
  }
}
