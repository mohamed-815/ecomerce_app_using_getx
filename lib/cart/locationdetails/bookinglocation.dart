import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/cart/locationdetails/locationcontroller.dart';
import 'package:orands_fish_booking/cart/modelclasses/locationmodel.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class BookingLocation extends StatelessWidget {
  BookingLocation({super.key});

  final LocationDetailsController c = Get.put(LocationDetailsController());

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              CartHeading(title1: 'Location Details'),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Place"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    controller1: c.placecontroller,
                    hint: 'Enter Place',
                    lebel: ' Place'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "pincode"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    controller1: c.pincodecontroller,
                    hint: 'Enter pincode',
                    lebel: 'pincode'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "city"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    controller1: c.citycontroller, hint: 'city', lebel: 'city'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "District"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    controller1: c.districtcontroller,
                    hint: 'District',
                    lebel: 'District'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Mobile no"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    controller1: c.mobilecontoller,
                    hint: 'Mobile no',
                    lebel: 'Mobile no'),
              ),
              khieght,
              khieght,
              khieght,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Submit'))),
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
                    Get.snackbar(
                        'Location Details', 'please complete the form');
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}

addingToFireBase(LocationDetail locationdetail) async {
  final adingtofirebase = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection(email!)
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
      .collection(email!)
      .doc('userdetails')
      .collection('userdetails')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => LocationDetail.fromJson(doc.data()))
          .single);

  // .map((snapshot) =>
  //     snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
}