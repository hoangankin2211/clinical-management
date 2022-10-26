import 'package:clinic_manager/features/patient/list_appointment_screen/controller/successful_controller.dart';
import 'package:get/get.dart';

class SuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessfulController>(() => SuccessfulController());
  }
}
