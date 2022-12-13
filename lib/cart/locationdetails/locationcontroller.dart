import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LocationDetailsController extends GetxController {
  final TextEditingController placecontroller = TextEditingController();
  final TextEditingController pincodecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController districtcontroller = TextEditingController();
  final TextEditingController mobilecontoller = TextEditingController();

  @override
  void dispose() {
    Get.delete<LocationDetailsController>();

    placecontroller.clear();
    pincodecontroller.clear();
    citycontroller.clear();
    districtcontroller.clear();
    mobilecontoller.clear();
    super.dispose();
  }
}
