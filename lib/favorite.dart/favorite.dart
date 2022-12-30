import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:orands_fish_booking/cart/placeordercontroller.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/favmodel.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/widjets/notfoundmsg.dart';

import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/TypeItem.dart';
import 'package:orands_fish_booking/widgetscommon/listitem.dart';
import 'package:orands_fish_booking/widgetscommon/typeitem.dart';

class Favorite extends StatelessWidget {
  Favorite({
    required this.titlelarge,
    required this.favoritedetail,
    Key? key,
  }) : super(key: key);
  Stream<List<FavModel>> favoritedetail;
  String titlelarge;

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff1b4332),
      body: Stack(
        children: [
          Image.network(
            "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.3),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
              child: Container(
            child: Column(
              children: [
                khieght,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      backbutton1(),
                      ItemListHeadingnewfont(title1: 'Favorites'),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 243, 4, 4),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Circleavdarnew(
                                color: Color.fromARGB(255, 40, 97, 73),
                              ),
                              Circleavdarnew(
                                  color: Color.fromARGB(255, 40, 97, 73)),
                              Circleavdarnew(
                                color: Color.fromARGB(255, 40, 97, 73),
                              ),
                            ],
                          ),
                          StreamBuilder(
                              stream: favoritedetail,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error Found');
                                }
                                if (snapshot.hasData) {
                                  final list = snapshot.data!;
                                  return Textwidgrt1(
                                      title1: '${list.length} Items');
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                    stream: favoritedetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('some thing went wrong');
                      }

                      if (snapshot.hasData) {
                        final showingitems = snapshot.data!;
                        return showingitems.isNotEmpty
                            ? Expanded(
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 4.5.h,
                                  children: List.generate(showingitems.length,
                                      (index) {
                                    final item = showingitems[index];

                                    return GestureDetector(
                                      onTap: () {
                                        final ModelProduct cartadditem =
                                            ModelProduct(
                                                id: item.id,
                                                isfave: item.isfave,
                                                imagelist: item.imagelist,
                                                description: item.description,
                                                name: item.name,
                                                category: item.category,
                                                minno: item.minno,
                                                price: item.price,
                                                size: item.size);
                                        Get.to(ItemShowingScreen(
                                            itemdetail: cartadditem));
                                      },
                                      child: SimpleItem(
                                          itemdetail: item,
                                          title1: item.price.toString(),
                                          title2: item.minno.toString(),
                                          image: item.imagelist![0],
                                          itemname: item.name,
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }),
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    khieght,
                                    khieght,
                                    khieght,
                                    khieght,
                                    Center(
                                        child: SearchHelper(
                                            image:
                                                'https://giffiles.alphacoders.com/202/20213.gif',
                                            title: 'Please Add Some.')),
                                  ],
                                ),
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
          )),
        ],
      ),
    );
  }
}

class Circleavdarnew extends StatelessWidget {
  Circleavdarnew({
    required this.color,
    Key? key,
  }) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}

class backbutton1 extends StatelessWidget {
  const backbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        placeordercontroller.basevaleu.value = 1;
        print(placeordercontroller.basevaleu.value.toString());
        Get.back();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.5),
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
