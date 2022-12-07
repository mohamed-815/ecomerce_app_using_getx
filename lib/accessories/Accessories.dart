import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/accessories/accessoriescontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingcontroller.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class Accessories extends StatelessWidget {
  Accessories({required this.titlelarge, super.key});
  String titlelarge;

  @override
  Widget build(BuildContext context) {
    final pages = [
      NewWidget(titlelarge: titlelarge),
      NewWidget(titlelarge: titlelarge),
      NewWidget(
        titlelarge: titlelarge,
        product1: showTheList(),
      ),
    ];
    return GetBuilder<AccessoriesController>(
        init: AccessoriesController(),
        builder: (c) {
          return Scaffold(
            body: pages[c.currentindex],
            bottomNavigationBar: GetBuilder<AccessoriesController>(
                init: AccessoriesController(),
                builder: (c) {
                  return BottomNavigationBar(
                      //  iconSize: 20,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.donut_large_outlined),
                            ],
                          ),
                          label: 'small',
                          backgroundColor: Color.fromARGB(255, 17, 17, 18),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.donut_small_outlined),
                          label: 'medium',
                          backgroundColor: Color.fromARGB(255, 40, 41, 41),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.donut_small),
                          label: 'big',
                          backgroundColor: Color.fromARGB(255, 48, 48, 49),
                        ),
                      ],
                      type: BottomNavigationBarType.shifting,
                      currentIndex: c.currentindex,
                      selectedItemColor: Colors.white,
                      iconSize: 25,
                      onTap: (index) {
                        c.indexChange(index);
                      },
                      elevation: 5);
                }),
          );
        });
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
    this.product1,
    required this.titlelarge,
  }) : super(key: key);

  final String titlelarge;
  Stream<List<ModelProduct>>? product1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AccessoriesController>(
            init: AccessoriesController(),
            builder: (c) {
              return ListingItemPage1(
                titlelarge: titlelarge,
                itemdtail: showTheList(),
              );
            }));
  }
}

class TypeItem extends StatelessWidget {
  TypeItem({
    required this.image,
    required this.itemname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;

  String itemname;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shieght / 3,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(7)),
            height: shieght / 6,
            // width: swidth / 2.5,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          khieght8,
          Row(
            children: [
              smalltextboldWidjets25(Title: itemname),
            ],
          ),
          Row(
            children: [GreyText(title: '1Ps 100Rs')],
          ),
          Row(
            children: [Text('Min 10 pc')],
          ),
        ],
      ),
    );
  }
}
