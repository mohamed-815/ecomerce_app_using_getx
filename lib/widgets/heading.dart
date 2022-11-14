import 'package:flutter/material.dart';
import 'package:orands_fish_booking/const/const.dart';

class CartHeading extends StatelessWidget {
  CartHeading({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class ItemListHeading extends StatelessWidget {
  ItemListHeading({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kwhite, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class Textwidgrt extends StatelessWidget {
  Textwidgrt({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class SettingText extends StatelessWidget {
  SettingText({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 30, fontWeight: FontWeight.w500),
    );
  }
}

class smalltextboldWidjets extends StatelessWidget {
  smalltextboldWidjets({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class smalltextboldWidjets25 extends StatelessWidget {
  smalltextboldWidjets25({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kwhite),
    );
  }
}

class TextOnly25 extends StatelessWidget {
  TextOnly25({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    );
  }
}
