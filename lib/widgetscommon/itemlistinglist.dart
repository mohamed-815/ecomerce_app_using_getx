import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumcontroller.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumfishes.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/TypeItem.dart';

class ListingItemPage1 extends StatelessWidget {
  ListingItemPage1({
    required this.titlelarge,
    required this.itemdtail,
    Key? key,
  }) : super(key: key);
  ItemDetail itemdtail;
  String titlelarge;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 87, 138, 177),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100))),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ItemListHeading(title1: titlelarge),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '6 Prodects found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                  // shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 30,
                  childAspectRatio: 1 / 1.2,
                  children: List.generate(15, (index) {
                    //final movie = state.searchResultList[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => ItemShowingScreen(
                            itemdetail: itemdtail,
                          )),
                      child: Card(
                        //elevation: 12,
                        color: Color.fromARGB(255, 115, 160, 197),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: TypeItem1(
                            image: itemdtail.images1[1],
                            itemname: itemdtail.title1,
                            title1: itemdtail.title2,
                            title2: itemdtail.title3,
                            shieght: 700.h,
                            swidth: 200.w),
                      ),
                    );
                    //  MainCard(
                    //   imageUrl: '$imageAppendUrl${movie.posterPath}',
                    // );
                  })),
            )
          ],
        ),
      ],
    ));
  }
}
