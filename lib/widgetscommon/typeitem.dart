import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class TypeItem1 extends StatelessWidget {
  TypeItem1({
    required this.title1,
    required this.title2,
    required this.image,
    required this.itemname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;

  String itemname;
  String title1;
  String title2;
  String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: shieght / 5,
          padding: EdgeInsets.all(8),
          //margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
                height: shieght / 7,
                width: swidth / 1.5,

                // child: Image.asset(
                //   image,
                //   fit: BoxFit.cover,
                // ),
              ),
              khieght8,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        smalltextboldWidjets25(Title: itemname),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          title1,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          title2,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 16,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white.withOpacity(.3),
            child: Icon(
              Icons.shopping_cart,
              size: 18,
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white.withOpacity(.3),
            child: Icon(
              Icons.favorite_border,
              size: 18,
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
      ],
    );
  }
}
