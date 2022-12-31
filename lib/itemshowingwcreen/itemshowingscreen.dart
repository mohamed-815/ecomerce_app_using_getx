import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/cartmodel.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/itemshowingwcreen/ItemshowingController.dart';

import 'package:orands_fish_booking/itemshowingwcreen/widgets/widgets.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/widjets/notfoundmsg.dart';

import 'package:orands_fish_booking/settings/widgets/settingscard.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class ItemShowingScreen extends StatelessWidget {
  ItemShowingScreen({required this.itemdetail, super.key});
  ModelProduct itemdetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ItemShowingController>(
          init: ItemShowingController(),
          builder: (c) {
            return SafeArea(
              child: Stack(
                children: [
                  Image.network(
                    "https://c4.wallpaperflare.com/wallpaper/503/63/644/black-blue-fish-wallpaper-preview.jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.7),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  ListView(
                    children: [
                      Container(
                        height: 250.h,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              c.itemChanging(index);
                            },
                            itemCount: itemdetail == null
                                ? c.images.length
                                : itemdetail.imagelist!.length,
                            itemBuilder: (context, index) {
                              // currentindex = index;

                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(itemdetail == null
                                          ? c.images[index]
                                          : itemdetail.imagelist![index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                              );
                            }),
                      ),
                      khieght,
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                itemdetail == null
                                    ? c.images.length
                                    : itemdetail.imagelist!.length,
                                (
                                  index,
                                ) =>
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 360),
                                        height: 6,
                                        color: c.currentindex == index
                                            ? Color.fromARGB(255, 8, 41, 69)
                                            : Colors.grey,
                                        width: c.currentindex == index ? 6 : 6,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                      khieght,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 300.w,
                                  child: TextItemShowName(
                                    title1: itemdetail == null
                                        ? 'oops'
                                        : ' ${itemdetail.name}',
                                  ),
                                ),
                              ],
                            ),
                            khieght,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PcCard(
                                    title: itemdetail == null
                                        ? 'oops'
                                        : itemdetail.price.toString()),
                              ],
                            ),
                            khieght,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Pccardadd(
                                    title: itemdetail == null
                                        ? '100'
                                        : 'min ${itemdetail.minno.toString()} ps'),
                                GestureDetector(
                                  onTap: () {},
                                  child: CardAddCart(
                                    title: "add to cart",
                                  ),
                                ),
                              ],
                            ),
                            khieght,
                            khieght,
                            Column(
                              children: [
                                Card(
                                  color: Colors.white.withOpacity(.1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        GreyText(
                                          title: 'Description',
                                        ),
                                        Text(
                                          itemdetail.description,
                                          //  "min 100 pc,\nOnly .2 inche size is available,\nseeds must be contitioned before puting in to the pond",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                khieght,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        onTap: () async {
                                          await showGeneralDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierLabel:
                                                  MaterialLocalizations.of(
                                                          context)
                                                      .modalBarrierDismissLabel,
                                              barrierColor: Color.fromARGB(115,
                                                  24, 22, 22),
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 500),
                                              pageBuilder:
                                                  (BuildContext buildContext,
                                                      Animation animation,
                                                      Animation
                                                          secondaryAnimation) {
                                                return SizeVarientItemShow(
                                                  Streamlist: showTheList(
                                                      category:
                                                          itemdetail.category,
                                                      size: 'small'),
                                                );
                                              });

                                          // List<ModelProduct> lastlist = [];

                                          // await Get.to(() => StreamBuilder(
                                          //     stream: showTheList(
                                          //         category: itemdetail.category,
                                          //         size: 'small'),
                                          //     builder: (context, snapshot) {
                                          //       if (snapshot.hasError) {
                                          //         return Center(
                                          //           child: Text(
                                          //               'Some Thing Wrong'),
                                          //         );
                                          //       }
                                          //       if (snapshot.hasData) {
                                          //         final list = snapshot.data;
                                          //         print(itemdetail.name);

                                          //         lastlist = list!
                                          //             .where((element) =>
                                          //                 element.name ==
                                          //                 itemdetail.name)
                                          //             .toList();

                                          //         print(lastlist.toString());
                                          //         return lastlist.isNotEmpty
                                          //             ? ItemShowingScreen(
                                          //                 itemdetail:
                                          //                     lastlist[0],
                                          //               )
                                          //             : ItemShowingScreen(
                                          //                 itemdetail:
                                          //                     itemdetail,
                                          //               );
                                          //       } else {
                                          //         return CircularProgressIndicator();
                                          //       }
                                          //     }));
                                        },
                                        child: Card(
                                            shadowColor: Colors.grey,
                                            elevation: 20.h,
                                            color: Colors.black,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: smalltextboldWidjets(
                                                  Title: 'Small'),
                                            ))),
                                    GestureDetector(
                                        onTap: () async {
                                          await showGeneralDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierLabel:
                                                  MaterialLocalizations.of(
                                                          context)
                                                      .modalBarrierDismissLabel,
                                              barrierColor: Color.fromARGB(115,
                                                  24, 22, 22),
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 500),
                                              pageBuilder:
                                                  (BuildContext buildContext,
                                                      Animation animation,
                                                      Animation
                                                          secondaryAnimation) {
                                                return SizeVarientItemShow(
                                                  Streamlist: showTheList(
                                                      category:
                                                          itemdetail.category,
                                                      size: 'medium'),
                                                );
                                              });
                                        },
                                        child: Card(
                                            shadowColor: Colors.grey,
                                            elevation: 20.h,
                                            color: Colors.black,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: smalltextboldWidjets(
                                                  Title: 'Medium'),
                                            ))),
                                    GestureDetector(
                                        onTap: () async {
                                          await showGeneralDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierLabel:
                                                  MaterialLocalizations.of(
                                                          context)
                                                      .modalBarrierDismissLabel,
                                              barrierColor: Color.fromARGB(115,
                                                  24, 22, 22),
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 500),
                                              pageBuilder:
                                                  (BuildContext buildContext,
                                                      Animation animation,
                                                      Animation
                                                          secondaryAnimation) {
                                                return SizeVarientItemShow(
                                                  Streamlist: showTheList(
                                                      category:
                                                          itemdetail.category,
                                                      size: 'large'),
                                                );
                                              });
                                        },
                                        child: Card(
                                            shadowColor: Colors.grey,
                                            elevation: 20.h,
                                            color: Colors.black,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: smalltextboldWidjets(
                                                  Title: 'Large'),
                                            ))),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Row(
                      children: [
                        backbutton1(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: GestureDetector(
                      onTap: () {
                        addingToCart(itemdetail);
                        Get.snackbar('Cart', 'Added to cart');
                        Get.to(CartPage());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.3),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Center SizeVarientItemShow({
    required Stream<List<ModelProduct>> Streamlist,
  }) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 18, 18, 18),
                borderRadius: BorderRadius.circular(12)),
            width: 340.w,
            height: 700.h,
            margin: EdgeInsets.only(top: 100, bottom: 40),
            padding: EdgeInsets.only(
              top: 0,
              // bottom: 10,
              //   left: 10,
              //  right: 10
            ),
            child: StreamBuilder(
                stream: Streamlist,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Some Thing Wrong'),
                    );
                  }
                  if (snapshot.hasData) {
                    final list = snapshot.data;
                    print(itemdetail.name);

                    final lastlist = list!
                        .where((element) => element.name == itemdetail.name)
                        .toList();

                    print(lastlist.toString());
                    return lastlist.isNotEmpty
                        ? ItemShowingScreen(
                            itemdetail: lastlist[0],
                          )
                        : Center(
                            child: NotFoundMsg(
                                image:
                                    'https://media3.giphy.com/media/1yiPpiqnOINUovWlCq/giphy.gif?cid=790b76112f8dd1dff8284d3873109383b979152b28e35c92&rid=giphy.gif&ct=g',
                                title: 'ooOps'),
                          );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          Positioned(
              top: 33.h,
              left: 109.w,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://acegif.com/wp-content/uploads/gifs/fish-97.gif'),
              ))
        ],
      ),
    );
  }
}
