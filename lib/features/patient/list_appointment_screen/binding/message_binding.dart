import 'package:clinic_manager/features/patient/list_appointment_screen/controller/message_controller.dart';
import 'package:get/get.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
