import 'package:clinic_manager/features/patient/doctor_detail/controller/book_appointment_controller.dart';
import 'package:clinic_manager/features/patient/history_acti/controller/call_record_controller.dart';
import 'package:get/get.dart';

class CallRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallRecordController>(() => CallRecordController());
  }
}
