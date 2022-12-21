import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  TextField1({
    Key? key,
    this.controller1,
    this.icon,
    required this.hint,
    required this.lebel,
  }) : super(key: key);
  String lebel;
  String hint;
  IconData? icon;
  TextEditingController? controller1;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      //obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lebel,
          hintText: hint,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
