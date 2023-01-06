import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';

class SearchController extends GetxController {
  final Rx<TextEditingController> controller = TextEditingController().obs;
  List<dynamic> searchlist = [].obs;
  List<dynamic> finalsearchlist = [].obs;
  seachFuntion(value1) {
    finalsearchlist = searchlist
        .where((element) =>
            element.name.toLowerCase().contains(value1.toLowerCase()))
        .toList();
    print(finalsearchlist.toString());
    update();
  }
}
