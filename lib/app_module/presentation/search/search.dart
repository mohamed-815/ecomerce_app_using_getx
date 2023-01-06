import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';
import 'package:orands_fish_booking/app_module/controllers/searchcontroller.dart';

import 'package:orands_fish_booking/app_module/presentation/search/widjets/search_textform.dart';
import 'package:orands_fish_booking/app_module/presentation/search/widjets/searchstream.dart';

class Search extends StatelessWidget {
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (c) {
              return Column(
                children: [
                  Container(
                    //height: shieght / 16,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: TextFieldSearch(
                        c: c,
                        controller1: c.controller.value,
                        hint: 'Search Here',
                        lebel: ' Search'),
                  ),
                  khieght,
                  khieght,
                  SearchStream(shieght: shieght, swidth: swidth, c: c)
                ],
              );
            }),
      )),
    );
  }
}

Stream<List<ModelProduct>> showTheListSearch() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('allproducts')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
