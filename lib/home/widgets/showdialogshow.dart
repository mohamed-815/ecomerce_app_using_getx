import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialogeshow extends StatelessWidget {
  ShowDialogeshow({
    required this.data,
    required this.item,
    Key? key,
  }) : super(key: key);
  Widget item;
  String data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            width: 340.w,
            height: 700.h,
            margin: const EdgeInsets.only(top: 100, bottom: 40),
            padding:
                const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
            child: item,
          ),
          Positioned(
              top: 33.h,
              left: 114.w,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(data),
              ))
        ],
      ),
    );
  }
}
