import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/controllers/cartcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/widgets/cartbuilder.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/widgets/numbercard.dart';
import 'package:orands_fish_booking/app_module/presentation/home/widgets/scafold_back.dart';
import 'package:orands_fish_booking/app_module/classes/cart_model/cartmodel.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/placeOrder.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/presentation/settings/widgets/settingscard.dart';

List<CartModel>? cartlist = [];
final CartController ca = Get.put(CartController());

class CartPage extends StatelessWidget {
  CartPage({this.formapage, super.key});

  String? formapage;
  double mosttotal = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ScafoldBackGroundImage(
              image:
                  "https://w0.peakpx.com/wallpaper/39/646/HD-wallpaper-fighter-fish-apple-beta-fish-orange-red-stills.jpg"),
          const ScafoldBackGroundColor(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Stack(
              children: [
                SizedBox(
                  height: 510.h,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: formapage == 'yes'
                            ? const BackBotton()
                            : const SizedBox(),
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
                                  color:
                                      const Color.fromARGB(255, 205, 201, 201),
                                  child: SizedBox(
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
                                                          const Color.fromARGB(
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
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      top: 100,
                                                                      bottom:
                                                                          40),
                                                                  padding: const EdgeInsets
                                                                          .only(
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
                                                                      const CircleAvatar(
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
                                color: const Color.fromARGB(255, 205, 201, 201),
                                child: SizedBox(
                                    height: 56.h,
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
