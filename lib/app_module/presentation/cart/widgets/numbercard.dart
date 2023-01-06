import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

class NumberCard1 extends StatelessWidget {
  NumberCard1({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: kblack,
        child: Container(
            margin: const EdgeInsets.all(10),
            child: SizedBox(child: Textwidgrt1(title1: title))));
  }
}

class BackBotton extends StatelessWidget {
  const BackBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.3),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
