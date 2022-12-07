import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/edibleseeds/ediblecontroller.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class EdibleSeeds extends StatelessWidget {
  EdibleSeeds({required this.category, super.key});
  String category;
  @override
  Widget build(BuildContext context) {
    final pages = [
      PageView1(category: category),
      PageView1(category: category),
      PageView1(category: category)
    ];
    return GetBuilder<EdibleController>(
        init: EdibleController(),
        builder: (c) {
          return Scaffold(
              body: pages[c.currentindex],
              bottomNavigationBar: GetBuilder<EdibleController>(
                  init: EdibleController(),
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
                            backgroundColor: Color.fromARGB(255, 81, 133, 174),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.donut_small_outlined),
                            label: 'medium',
                            backgroundColor: Color.fromARGB(255, 81, 133, 174),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.donut_small),
                            label: 'big',
                            backgroundColor: Color.fromARGB(255, 123, 150, 172),
                          ),
                        ],
                        type: BottomNavigationBarType.shifting,
                        currentIndex: c.currentindex,
                        selectedItemColor: Colors.black,
                        iconSize: 25,
                        onTap: (index) {
                          c.indexChange(index);
                        },
                        elevation: 5);
                  }));
        });
  }
}

class PageView1 extends StatelessWidget {
  const PageView1({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<EdibleController>(
            init: EdibleController(),
            builder: (c) {
              return ListingItemPage1(
                titlelarge: category,

                //itemdtail: c.edibledetail
              );
            }));
  }
}

class GetBack1 extends StatelessWidget {
  const GetBack1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.3),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
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
