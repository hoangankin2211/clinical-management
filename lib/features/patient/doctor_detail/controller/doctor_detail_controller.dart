import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/doctor.dart';
import '../../../../models/rating.dart';
import '../../../../routes/route_name.dart';
import '../../../../services/data_services.dart';

class DoctorDetailController extends GetxController {
  final Doctor doctor = Get.arguments["doctor"] as Doctor;
  final Rx<List<Reviews>> listReview = Rx<List<Reviews>>([]);

  var isLoading = false.obs;
  fetchAllReviewOfDoctor() async {
    listReview.value = await DataService.instance.getAllReviews(() {
      Get.toNamed(RouteNames.viewReiviewScreen);
    }, doctor.email!);
  }

  addComennt(
      {required String doctorId,
      required String reviews,
      required BuildContext context,
      required double rating}) async {
    await DataService.instance.addReview(
      doctor: doctorId,
      rating: rating,
      reviews: reviews,
      callBack: (data) {
        listReview.value.add(data);
        Navigator.of(context).pop({
          'check': 0,
        });
        update();
      },
    );
  }
}
