import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/controllers/locationcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/common_textform.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/classes/location_model/locationmodel.dart';

class BookingLocation extends StatelessWidget {
  BookingLocation({super.key});

  final LocationDetailsController c = Get.put(LocationDetailsController());

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CartHeadingbblack(title1: 'Location Details'),
            khieght,
            khieght,
            SizedBox(
              child: TextField1(
                  controller1: c.placecontroller,
                  hint: 'Enter Place',
                  lebel: ' Place'),
            ),
            khieght,
            khieght,
            SizedBox(
              child: TextField1(
                  controller1: c.pincodecontroller,
                  hint: 'Enter pincode',
                  lebel: 'pincode'),
            ),
            khieght,
            khieght,
            SizedBox(
              child: TextField1(
                  controller1: c.citycontroller, hint: 'city', lebel: 'city'),
            ),
            khieght,
            khieght,
            SizedBox(
              child: TextField1(
                  controller1: c.districtcontroller,
                  hint: 'District',
                  lebel: 'District'),
            ),
            khieght,
            khieght,
            SizedBox(
              child: TextField1(
                  controller1: c.mobilecontoller,
                  hint: 'Mobile no',
                  lebel: 'Mobile no'),
            ),
            khieght,
            khieght,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: SizedBox(
                  width: swidth / 1.5,
                  child: const Center(child: Text('Submit'))),
              onPressed: () {
                if (c.placecontroller.text.isNotEmpty &&
                    c.pincodecontroller.text.isNotEmpty &&
                    c.citycontroller.text.isNotEmpty &&
                    c.districtcontroller.text.isNotEmpty &&
                    c.mobilecontoller.text.isNotEmpty) {
                  final locationdetail = LocationDetail(
                      city: c.citycontroller.text,
                      district: c.districtcontroller.text,
                      mobileno: c.mobilecontoller.text,
                      pincode: c.pincodecontroller.text,
                      place: c.placecontroller.text);

                  addingToFireBase(locationdetail);
                  Get.back();
                } else {
                  Get.snackbar('Location Details', 'please complete the form');
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}

addingToFireBase(LocationDetail locationdetail) async {
  final adingtofirebase = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('userdetails')
      .collection('userdetails')
      .doc('userdetails');

  final json = locationdetail.toJson();

  await adingtofirebase.set(json);
}

Stream<LocationDetail> LocationStream() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('userdetails')
      .collection('userdetails')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => LocationDetail.fromJson(doc.data()))
          .single);
}
