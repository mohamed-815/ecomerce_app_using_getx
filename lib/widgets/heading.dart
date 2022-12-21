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

class CartHeading1 extends StatelessWidget {
  CartHeading1({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
        color: kwhite,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
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

class Textwidgrt1 extends StatelessWidget {
  Textwidgrt1({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
          color: Color.fromARGB(255, 168, 165, 165),
          fontSize: 20,
          fontWeight: FontWeight.bold),
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

class smalltextboldWidjetswhite extends StatelessWidget {
  smalltextboldWidjetswhite({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
    );
  }
}

class smalltextboldWidjets9 extends StatelessWidget {
  smalltextboldWidjets9({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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

class smalltextboldWidjets25black extends StatelessWidget {
  smalltextboldWidjets25black({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kblack),
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

class TextOnly5 extends StatelessWidget {
  TextOnly5({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
        color: Color.fromARGB(255, 237, 234, 234),
        fontSize: 25,
      ),
    );
  }
}
