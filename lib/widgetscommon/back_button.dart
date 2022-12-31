import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/placeOrder.dart';

class backbutton1 extends StatelessWidget {
  const backbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        placeordercontroller.basevaleu.value = 1;
        print(placeordercontroller.basevaleu.value.toString());
        Get.back();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.5),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
