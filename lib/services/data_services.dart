import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_link.dart';
import '../models/doctor.dart';
import '../models/rating.dart';
import 'auth_services.dart';

class DataService extends GetxController {
  DataService._privateConstructor();
  static final DataService instance = DataService._privateConstructor();
  static late Rx<List<Doctor>> _doctorList = Rx<List<Doctor>>([]);
  final RxBool isLoading = false.obs;
  List<Doctor> get doctorList => _doctorList.value;

  Future<bool> fetchAllData() async {
    return true;
  }

  Future<List<Reviews>> getAllReviews(
      VoidCallback callBack, String emailDoctor) async {
    List<Reviews> data = [];
    try {
      print("Call api get all reviews ");
      http.Response res = await http.get(
        Uri.parse(
          '${ApiLink.uri}/api/doctors/getAllReviews/$emailDoctor',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        data.clear();
        print(res.body);
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          Map<String, dynamic> map = jsonDecode(res.body)[i];
          data.add(Reviews.fromJson(map));
        }
        isLoading.value = true;
      }
    } catch (e) {
      // ignore: avoid_print
      print('err ${e.toString()}');
    } finally {
      callBack();
    }
    return data;
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
        print(res.body);
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

  addReview({
    required String doctor,
    required double rating,
    required String reviews,
    required VoidCallback callBack,
  }) async {
    try {
      print("call api insert reviews");
      http.Response res = await http.post(
        Uri.parse(
          '${ApiLink.uri}/api/doctors/addReview',
        ),
        body: jsonEncode(
          {
            'userSend': AuthService.instance.user.email,
            'doctor': doctor,
            'rating': rating,
            'reviews': reviews,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      callBack();
    }
  }

  fetchAllDoctorData() async {
    if (_doctorList.value.isNotEmpty) return;
    // await getAllDataApi();
  }
}
