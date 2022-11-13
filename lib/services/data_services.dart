import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_link.dart';
import '../models/doctor.dart';

class DataService extends GetxController {
  DataService._privateConstructor();
  static final DataService instance = DataService._privateConstructor();
  static late Rx<List<Doctor>> _doctorList = Rx<List<Doctor>>([]);
  final RxBool isLoading = false.obs;
  List<Doctor> get doctorList => _doctorList.value;

  Future<bool> fetchAllData() async {
    return true;
  }

  Future<List<Doctor>> getAllDataApi(VoidCallback callback) async {
    List<Doctor> data = [];
    try {
      print("call apit get data");
      http.Response res = await http.get(
        Uri.parse(
          '${ApiLink.uri}/api/doctors/getAll',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        data.clear();
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          Map<String, dynamic> map = jsonDecode(res.body)[i];
          data.add(Doctor.fromJson(map));
        }
        isLoading.value = true;
      }
    } catch (e) {
      print('error: ${e.toString()}');
    } finally {
      callback();
    }
    return data;
  }

  fetchAllDoctorData() async {
    if (_doctorList.value.isNotEmpty) return;
    // await getAllDataApi();
  }
}
