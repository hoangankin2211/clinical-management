import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/api_link.dart';
import '../../../../models/doctor.dart';
import '../../../../services/data_services.dart';

class HomeScreenController extends GetxController {
  final Rx<List<Doctor>> listDoctor = Rx<List<Doctor>>([]);
  var isLoading = false.obs;

  fetchData() async {
    listDoctor.value = await DataService.instance.getAllDataApi(() {
      isLoading(false);
    });
  }

  @override
  void onInit() {
    super.onInit();
    // getAllDataApi();
    fetchData();
    update();
  }
}
