import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialogeshow extends StatelessWidget {
  ShowDialogeshow({
    required this.item,
    Key? key,
  }) : super(key: key);
  Widget item;
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
              left: 109.w,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbGrm3C3QgWyL0mk3GbQ6JC36t_w1G9VzAww&usqp=CAU'),
              ))
        ],
      ),
    );
  }
}
