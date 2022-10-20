import 'package:clinic_manager/features/patient/doctor_detail/controller/doctor_detail_controller.dart';
import 'package:get/get.dart';

class DoctorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorDetailController>(() => DoctorDetailController());
  }
}
