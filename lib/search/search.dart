import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
                  // GestureDetector(
                  //   onTap: () => Get.back(),
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.white.withOpacity(.3),
                  //     child: Icon(Icons.arrow_back),
                  //   ),
                  // ),
                ],
              ),
              khieght,
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'Search Here', lebel: ' Search'),
              ),
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
            ],
          ),
        ),
      )),
    );
  }
}
