import 'package:flutter/material.dart';

class Circleavdarnew extends StatelessWidget {
  Circleavdarnew({
    required this.color,
    Key? key,
  }) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}
