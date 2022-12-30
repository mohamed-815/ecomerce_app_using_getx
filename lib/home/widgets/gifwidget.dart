import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class GifWidget extends StatelessWidget {
  GifWidget({
    required this.data,
    required this.image,
    Key? key,
  }) : super(key: key);
  String image;
  String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover)),
      child: Center(
        child: CartHeading(title1: data),
      ),
    );
  }
}
