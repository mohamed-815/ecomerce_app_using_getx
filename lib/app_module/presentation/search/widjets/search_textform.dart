import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/searchcontroller.dart';

class TextFieldSearch extends StatelessWidget {
  TextFieldSearch({
    Key? key,
    required this.c,
    this.controller1,
    this.icon,
    required this.hint,
    required this.lebel,
  }) : super(key: key);
  String lebel;
  String hint;
  IconData? icon;
  TextEditingController? controller1;
  SearchController c;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (co) {
          return TextFormField(
            controller: controller1,

            //obscureText: true,
            decoration: InputDecoration(
                fillColor: Colors.grey,
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 38, 39, 39), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 49, 44, 44),
                      width: 1.5,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: lebel,
                hintText: hint,
                suffixIcon: Icon(
                  icon,
                  color: Colors.black,
                )),

            onChanged: (value) {
              co.seachFuntion(value);
              print(value);
            },
          );
        });
  }
}
