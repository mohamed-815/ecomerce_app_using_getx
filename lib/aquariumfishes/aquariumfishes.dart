import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumcontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/TypeItem.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class AquariumFishes extends StatelessWidget {
  AquariumFishes({required this.category, super.key});

  String category;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ShowingSizePages(category: category),
      ShowingSizePages(category: category),
      Text('hello')
    ];
    return GetBuilder<AquariumController>(
        init: AquariumController(),
        builder: (c) {
          return Scaffold(
            body: pages[c.currentindex],
            bottomNavigationBar: GetBuilder<AquariumController>(
                init: AquariumController(),
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

class ShowingSizePages extends StatelessWidget {
  const ShowingSizePages({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AquariumController>(
        init: AquariumController(),
        builder: (c) {
          return ListingItemPage1(
              titlelarge: category, itemdtail: c.edibledetail);
        });
  }
}

class ListingItemPage extends StatelessWidget {
  const ListingItemPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AquariumController>(
            init: AquariumController(),
            builder: (c) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CartHeading(title1: 'Aquarium Fishes'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('6 Prodects found'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 1.4,
                        children: List.generate(15, (index) {
                          //final movie = state.searchResultList[index];
                          return GestureDetector(
                            onTap: () => Get.to(() => ItemShowingScreen(
                                  itemdetail: c.edibledetail,
                                )),
                            child: TypeItem1(
                                title1: c.edibledetail.title1,
                                title2: c.edibledetail.title2,
                                image: c.edibledetail.images1[1],
                                itemname: 'GoldFish',
                                shieght: 800.h,
                                swidth: 200.w),
                          );
                          //  MainCard(
                          //   imageUrl: '$imageAppendUrl${movie.posterPath}',
                          // );
                        })),
                  )
                ],
              );
            }));
  }
}
