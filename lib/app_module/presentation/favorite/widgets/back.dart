import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/placeordercontroller.dart';

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
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}

class backbutton2 extends StatelessWidget {
  const backbutton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.1),
        child: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 208, 205, 205),
        ),
      ),
    );
  }
}
