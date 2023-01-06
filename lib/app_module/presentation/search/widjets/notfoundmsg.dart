import 'package:flutter/material.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

class SearchHelper extends StatelessWidget {
  SearchHelper({
    required this.image,
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textwidgetwhite(title1: title),
        khieght,
        khieght,
        khieght,
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }
}

class NotFoundMsg extends StatelessWidget {
  NotFoundMsg({
    required this.image,
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        khieght,
        khieght,
        khieght,
        khieght,
        khieght,
        khieght,
        khieght,
        khieght,
        khieght,
        Textwidgrt1(title1: title),
        khieght,
        khieght,
        khieght,
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }
}
