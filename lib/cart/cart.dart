import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/cart/cartcontroller.dart';
import 'package:orands_fish_booking/cart/widgets/cartbuilder.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/cartmodel.dart';
import 'package:orands_fish_booking/cart/placeOrder.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/settings/widgets/settingscard.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

List<CartModel>? cartlist = [];
final CartController ca = Get.put(CartController());

class CartPage extends StatelessWidget {
  CartPage({super.key});
  double mosttotal = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.network(
            "https://w0.peakpx.com/wallpaper/39/646/HD-wallpaper-fighter-fish-apple-beta-fish-orange-red-stills.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.3),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Stack(
              children: [
                SizedBox(
                  height: 570.h,
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BackBotton(),
                      ),
                      khieght,
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CartHeading1(title1: 'Cart'),
                                StreamBuilder(
                                    stream: showTheCartList(),
                                    builder: (context, snapshot) {
                                      cartlist = snapshot.data;
                                      return Card(
                                        color: Colors.white.withOpacity(.2),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GreyText1(
                                              title:
                                                  '${cartlist?.length} Items'),
                                        ),
                                      );
                                    })
                              ],
                            ),
                            OfferBuilder(
                              stream1: showTheCartList(),
                            ),

                            // Stack(
                            //   children: [
                            //     Container(
                            //         color: Colors.black,
                            //         // margin: EdgeInsets.symmetric(horizontal: 1),
                            //         height: 120.h,
                            //         width: 325.h,
                            //         child: Image.asset(
                            //           'assets/Moor_color_change.jpg',
                            //           fit: BoxFit.cover,
                            //         )),
                            //     Addingcard(),
                            //     Positioned(
                            //       bottom: 70.w,
                            //       left: 13.w,
                            //       child: NumberCard(title: '100ps'),
                            //     ),
                            //   ],
                            // ),
                            //  / khieght,
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     NumberCard(title: '500rs'),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: StreamBuilder(
                      stream: showTheCartList(),
                      builder: (context, snapshot) {
                        final cartlist = snapshot.data;

                        print(cartlist);
                        print(cartlist);
                        print(cartlist);
                        return cartlist?.length != 0
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Card(
                                  color: Color.fromARGB(255, 205, 201, 201),
                                  child: Container(
                                    height: 56.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: StreamBuilder(
                                                stream: showTotal(),
                                                builder: (context, snapshot) {
                                                  final total = snapshot.data;

                                                  if (total == null) {}
                                                  return NumberCard1(
                                                      title: total != null
                                                          ? "${total.toString()}rs"
                                                          : '');
                                                })),
                                        StreamBuilder(
                                            stream: showTotal(),
                                            builder: (context, snapshot) {
                                              final total = snapshot.data;
                                              return GestureDetector(
                                                onTap: () async {
                                                  await showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      barrierLabel:
                                                          MaterialLocalizations
                                                                  .of(context)
                                                              .modalBarrierDismissLabel,
                                                      barrierColor:
                                                          Color.fromARGB(
                                                              115, 24, 22, 22),
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      pageBuilder: (BuildContext
                                                              buildContext,
                                                          Animation animation,
                                                          Animation
                                                              secondaryAnimation) {
                                                        return Center(
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12)),
                                                                  width: 340.w,
                                                                  height: 700.h,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              100,
                                                                          bottom:
                                                                              40),
                                                                  padding: EdgeInsets.only(
                                                                      top: 0,
                                                                      bottom:
                                                                          10,
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      placeOrderhere(
                                                                    total: total !=
                                                                            null
                                                                        ? total
                                                                        : 0,
                                                                  )),
                                                              Positioned(
                                                                  top: 33.h,
                                                                  left: 109.w,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 60,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            'https://64.media.tumblr.com/5bb3e6a3747208119d664f88d8a6b276/3f1a6b4f37a59fd6-73/s540x810/e5c00b57ccb3da16b80e7525e19fa2d886d9fd22.gif'),
                                                                  ))
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8),
                                                    child: NumberCard1(
                                                        title: 'Checkout')),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Card(
                                color: Color.fromARGB(255, 205, 201, 201),
                                child: Container(
                                    height: 56.h,
                                    //width: 200.h,
                                    //margin: EdgeInsets.symmetric(horizontal: 65.w),
                                    child: Center(
                                      child: NumberCard1(
                                        title: 'The Cart is empty',
                                      ),
                                    )),
                              );
                      }),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class CartTile extends StatelessWidget {
  CartTile({
    required this.total,
    required this.id,
    required this.carttiledetail,
    Key? key,
  }) : super(key: key);

  double total;
  String id;
  CartModel carttiledetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          khieght,
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(
                      carttiledetail.imagelist![0],
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                ),

                // margin: EdgeInsets.symmetric(horizontal: 1),
                height: 140.h,
                width: 325.h,
              ),
              Addingcard(id: id, itemdetail: carttiledetail),
              Positioned(
                bottom: 70.w,
                left: 13.w,
                child: NumberCard1(title: '${carttiledetail.minnomultiple}ps'),
              ),
              Positioned(
                bottom: 10.w,
                left: 13.w,
                child: NumberCard1(title: carttiledetail.name),
              ),
              Positioned(
                bottom: 7.w,
                right: 23.w,
                child: GestureDetector(
                  onTap: () {
                    deleteItem(id);
                  },
                  child: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          khieght,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NumberCard1(title: '${carttiledetail.subtotalprice}rs'),
            ],
          ),
          khieght,
        ],
      ),
    );
  }
}

class Addingcard extends StatelessWidget {
  Addingcard({
    required this.id,
    required this.itemdetail,
    Key? key,
  }) : super(key: key);

  String id;
  CartModel itemdetail;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 34.w,
      right: 13.w,
      child: Card(
        elevation: 2.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromARGB(255, 216, 214, 214).withOpacity(.1),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Addingmore(id, itemdetail);
              },
              child: Card(
                  color: Color.fromARGB(255, 23, 23, 23),
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
            ),
            GestureDetector(
              onTap: () {
                RemoveThings(id, itemdetail);
              },
              child: Card(
                  color: Color.fromARGB(255, 6, 6, 6),
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  NumberCard({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromARGB(255, 71, 70, 70),
        child: Container(
            margin: EdgeInsets.all(10), child: Textwidgrt(title1: title)));
  }
}

class NumberCard1 extends StatelessWidget {
  NumberCard1({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: kblack,
        child: Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(child: Textwidgrt1(title1: title))));
  }
}

class BackBotton extends StatelessWidget {
  const BackBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}

Stream<List<CartModel>> showTheCartList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('cartlist')
      .collection('cartlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList());
}

Addingmore(String id, CartModel itemdetail) async {
  itemdetail.minnomultiple = itemdetail.minno + itemdetail.minnomultiple;

  final fireinstance = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('cartlist')
      .collection('cartlist')
      .doc(id);

  await fireinstance.update({
    'minnomultiple': itemdetail.minnomultiple,
    'subtotalprice': itemdetail.minnomultiple * itemdetail.price
  });

  Get.snackbar('Add', 'More Quantity added');
}

RemoveThings(String id, CartModel itemdetail) async {
  if (itemdetail.minnomultiple != itemdetail.minno) {
    itemdetail.minnomultiple = itemdetail.minnomultiple - itemdetail.minno;
  }

  final fireinstance = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('cartlist')
      .collection('cartlist')
      .doc(id);

  await fireinstance.update({
    'minnomultiple': itemdetail.minnomultiple,
    'subtotalprice': itemdetail.minnomultiple * itemdetail.price
  });

  Get.snackbar('Add', 'More Quantity added');
}

deleteItem(id) async {
  final fireinstance = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('cartlist')
      .collection('cartlist')
      .doc(id);

  await fireinstance.delete();
  Get.snackbar('Add', 'Deleted');
}
