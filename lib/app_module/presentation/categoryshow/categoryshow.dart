import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/categoryshowcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/itemlistinglist.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';

import 'package:orands_fish_booking/app_module/presentation/settings/widgets/settingscard.dart';

class Accessories extends StatelessWidget {
  Accessories({required this.category, required this.titlelarge, super.key});
  String titlelarge;
  String category;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ListingItemPage1(
        titlelarge: titlelarge,
        itemdtail: showTheList(category: category, size: 'small'),
      ),
      ListingItemPage1(
        titlelarge: titlelarge,
        itemdtail: showTheList(category: category, size: 'medium'),
      ),
      ListingItemPage1(
        titlelarge: titlelarge,
        itemdtail: showTheList(category: category, size: 'large'),
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
            children: const [Text('Min 10 pc')],
          ),
        ],
      ),
    );
  }
}
