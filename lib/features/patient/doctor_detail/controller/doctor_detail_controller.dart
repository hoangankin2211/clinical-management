import 'package:get/get.dart';

import '../../../../models/doctor.dart';

class DoctorDetailController extends GetxController {
  final Doctor doctor = Get.arguments["doctor"] as Doctor;
}
