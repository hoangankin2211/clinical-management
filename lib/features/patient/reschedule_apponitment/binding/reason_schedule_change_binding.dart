import 'package:clinic_manager/features/patient/reschedule_apponitment/controller/reason_schedule_change_controller.dart';
import 'package:get/get.dart';

class ReasonScheduleChangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReasonScheduleChangeController>(
        () => ReasonScheduleChangeController());
  }
}
