import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/birds/birdscontroller.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class Birds extends StatelessWidget {
  Birds({required this.titlelarge, super.key});
  String titlelarge;

  @override
  Widget build(BuildContext context) {
    final pages = [
      DifferentSizeItems(titlelarge: titlelarge),
      DifferentSizeItems(titlelarge: titlelarge),
      DifferentSizeItems(titlelarge: titlelarge)
    ];
    return GetBuilder<BirdController>(
        init: BirdController(),
        builder: (c) {
          return Scaffold(
            body: pages[c.currentindex],
            bottomNavigationBar: GetBuilder<BirdController>(
                init: BirdController(),
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
                }),
          );
        });
  }
}

class DifferentSizeItems extends StatelessWidget {
  const DifferentSizeItems({
    Key? key,
    required this.titlelarge,
  }) : super(key: key);

  final String titlelarge;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BirdController>(
        init: BirdController(),
        builder: (c) {
          return ListingItemPage1(
            titlelarge: titlelarge,
            itemdtail: c.birddetail,
          );
        });
  }
}
