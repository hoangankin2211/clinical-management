import 'package:clinic_manager/features/patient/my_appointment_detail_screen.dart/controller/my_appointment_detail_controller.dart';
import 'package:get/get.dart';

class MyAppointmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppointmentDetailController>(
        () => MyAppointmentDetailController());
  }
}
