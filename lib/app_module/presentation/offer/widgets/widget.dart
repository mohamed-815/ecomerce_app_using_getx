import 'package:flutter/material.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';

class OfferItemNameWidget extends StatelessWidget {
  const OfferItemNameWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 21, 20, 20).withOpacity(.3),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Textwidgrt1(
          title1: item,
        ),
      ),
    );
  }
}
