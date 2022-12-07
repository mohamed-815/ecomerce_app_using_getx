import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumcontroller.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumfishes.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/TypeItem.dart';

class ListingItemPage1 extends StatelessWidget {
  ListingItemPage1({
    required this.titlelarge,
    this.itemdtail,
    Key? key,
  }) : super(key: key);
  Stream<List<ModelProduct>>? itemdtail;
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
                  backbutton1(),
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
            StreamBuilder(
                stream: showTheList(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('some thing went wrong');
                  }

                  if (snapshot.hasData) {
                    final showingitems = snapshot.data!;
                    return Expanded(
                      child: GridView.count(

                          // shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 30,
                          childAspectRatio: 1 / 1.2,
                          children: List.generate(showingitems.length, (index) {
                            //final movie = state.searchResultList[index];
                            return GestureDetector(
                              onTap: () => Get.to(() => ItemShowingScreen(
                                    itemdetail: showingitems[index],
                                  )),
                              child: Card(
                                //elevation: 12,
                                color: Color.fromARGB(255, 115, 160, 197),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: TypeItem1(
                                    itemdetail: showingitems[index],
                                    image: showingitems[index].imagelist![0],
                                    itemname: showingitems[index].name,
                                    title1:
                                        showingitems[index].price.toString(),
                                    title2:
                                        showingitems[index].minno.toString(),
                                    shieght: 700.h,
                                    swidth: 200.w),
                              ),
                            );
                            //  MainCard(
                            //   imageUrl: '$imageAppendUrl${movie.posterPath}',
                            // );
                          })),
                    );

                    // ListView(
                    //   children: showingitems
                    //       .map((e) => MyWidget(
                    //             item: e,
                    //             id: e.id,
                    //           ))
                    //       .toList(),
                    // );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // ListView.builder(
                  //     itemCount: products.length,
                  //     itemBuilder: (context, index) {
                  //       final item = products[index];
                  //       return MyWidget(item: item);
                  //     }

                  //     //  MyWidget(item: products)

                  //     )
                }),
            // Expanded(
            //   child: GridView.count(
            //       // shrinkWrap: true,
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 6,
            //       crossAxisSpacing: 30,
            //       childAspectRatio: 1 / 1.2,
            //       children: List.generate(15, (index) {
            //         //final movie = state.searchResultList[index];
            //         return GestureDetector(
            //           onTap: () => Get.to(() => ItemShowingScreen(
            //                 itemdetail: itemdtail,
            //               )),
            //           child: Card(
            //             //elevation: 12,
            //             color: Color.fromARGB(255, 115, 160, 197),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: TypeItem1(
            //                 image: itemdtail?.imagelist![0],
            //                 itemname: itemdtail?.name,
            //                 title1: itemdtail?.minno,
            //                 title2: itemdtail?.description,
            //                 shieght: 700.h,
            //                 swidth: 200.w),
            //           ),
            //         );
            //         //  MainCard(
            //         //   imageUrl: '$imageAppendUrl${movie.posterPath}',
            //         // );
            //       })),
            // )
          ],
        ),
      ],
    ));
  }
}

class backbutton1 extends StatelessWidget {
  const backbutton1({
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

class backbutton2 extends StatelessWidget {
  const backbutton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.1),
        child: Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 208, 205, 205),
        ),
      ),
    );
  }
}
