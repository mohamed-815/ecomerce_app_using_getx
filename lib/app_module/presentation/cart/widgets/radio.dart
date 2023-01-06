import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/placeordercontroller.dart';

class radioButton extends StatelessWidget {
  radioButton({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  int value;
  void Function(int?)? onChange;
  @override
  Widget build(BuildContext context) {
    return GetX<PlaceOrderController>(
        init: PlaceOrderController(),
        builder: (c) {
          return Radio(
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: value,
              groupValue: c.basevaleu.value,
              onChanged: onChange);
        });
  }
}
