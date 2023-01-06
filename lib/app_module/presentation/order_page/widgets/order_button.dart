import 'package:flutter/material.dart';
import 'package:orands_fish_booking/const/const.dart';

class buttonNew extends StatelessWidget {
  buttonNew({
    required this.color,
    required this.data,
    this.onpress,
    Key? key,
  }) : super(key: key);
  void Function()? onpress;
  Color color;
  String data;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onpress,
        child: SizedBox(
            width: 100, child: Center(child: Text(data == null ? '' : data))));
  }
}
