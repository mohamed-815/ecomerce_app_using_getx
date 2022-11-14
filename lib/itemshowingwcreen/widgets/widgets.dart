import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class PcCard extends StatelessWidget {
  PcCard({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Container(
            margin: EdgeInsets.all(10),
            child: smalltextboldWidjets(
              Title: '1 ps @ 10 Rs',
            )));
  }
}

class Pccardadd extends StatelessWidget {
  Pccardadd({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Color.fromARGB(255, 216, 211, 211),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.add, size: 20),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  )),
              Icon(Icons.remove, size: 15),
            ],
          ),
        ));
  }
}

class CardAddCart extends StatelessWidget {
  CardAddCart({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Color.fromARGB(255, 31, 29, 29),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
