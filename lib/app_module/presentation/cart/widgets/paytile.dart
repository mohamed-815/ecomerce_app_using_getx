import 'package:flutter/material.dart';
import 'package:orands_fish_booking/app_module/controllers/placeordercontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/widgets/radio.dart';

class Razortile extends StatelessWidget {
  Razortile({
    required this.c,
    required this.image1,
    required this.text1,
    Key? key,
  }) : super(key: key);
  String image1;
  String text1;
  PlaceOrderController c;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.all(.5),
      leading: Image.asset(
        image1,
      ),
      title: PayText(data: text1),
      trailing: radioButton(
        value: 1,
        onChange: (value) {
          c.changingvaleu(value!);
        },
      ),
    );
  }
}

class PayText extends StatelessWidget {
  PayText({
    required this.data,
    Key? key,
  }) : super(key: key);
  String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
    );
  }
}
