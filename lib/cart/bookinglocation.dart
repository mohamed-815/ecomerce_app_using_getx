import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class BookingLocation extends StatelessWidget {
  const BookingLocation({super.key});

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
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Place"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'Enter Place', lebel: ' Place'),
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
                child: TextField1(hint: 'Enter pincode', lebel: 'pincode'),
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
                child: TextField1(hint: 'city', lebel: 'city'),
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
                child: TextField1(hint: 'District', lebel: 'District'),
              ),
              khieght,
              khieght,
              khieght,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Submit'))),
                onPressed: () {},
              )
            ],
          ),
        ),
      )),
    );
  }
}
