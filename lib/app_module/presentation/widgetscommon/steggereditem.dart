import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/cart.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/listitem.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/stegereditemtext.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/classes/cart_model/cartmodel.dart';
import 'package:orands_fish_booking/app_module/classes/fav_model/favmodel.dart';
import 'package:orands_fish_booking/app_module/classes/fav.dart';

class StaggeredItem extends StatelessWidget {
  StaggeredItem({
    Key? key,
    required this.isfromtotal,
    required this.index,
    required this.item,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);
  String isfromtotal;
  var item;
  final double shieght;
  final double swidth;
  int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: index % 2 == 0 ? 180.h : 275.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            shadowColor: Colors.black,
            elevation: 10.h,
            child: Stack(
              children: [
                Container(
                  height: index % 2 == 0 ? 180.h : 275.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4')),
                      borderRadius: BorderRadius.circular(9)),
                ),
                Container(
                  height: index % 2 == 0 ? 170.h : 265.h,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(9)),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                                image: NetworkImage(item.imagelist![0]),
                                fit: BoxFit.cover)),
                        height: index % 2 == 0 ? shieght / 7 : shieght / 3.6,
                        width: swidth / 1.5,
                      ),
                      khieght8,
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 130.w,
                                    child: smalltextboldWidjets25black(
                                        Title: item.name)),
                              ],
                            ),
                            Row(
                              children: [
                                StaggeredItemText(item: '${item.price} rs')
                              ],
                            ),
                            Row(
                              children: [
                                item.category != 'feeds'
                                    ? StaggeredItemText(
                                        item: 'min ${item.minno} ps')
                                    : StaggeredItemText(
                                        item: 'min ${item.minno} kg'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      addingToCart(item);
                      Get.snackbar('Cart', 'Added to cart');
                      Get.to(CartPage(
                        formapage: 'yes',
                      ));
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 18,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
                isfromtotal == 'yes'
                    ? Positioned(
                        top: 10,
                        left: 8,
                        child: StreamBuilder(
                            stream: listOfFavStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return SizedBox();
                              }
                              if (snapshot.hasData) {
                                List<FavModel>? favlist = [];

                                favlist = snapshot.data;
                                final newfav = favlist!
                                    .where(
                                        (element) => element.oldid == item.id)
                                    .toList();

                                return newfav.isEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          addingTofav(item);
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              Colors.white.withOpacity(.3),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                            color: Colors.black.withOpacity(.7),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          deleteFromFav(favlist![0].id);
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              Colors.white.withOpacity(.3),
                                          child: Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: Colors.black.withOpacity(.7),
                                          ),
                                        ),
                                      );
                              } else {
                                return CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white.withOpacity(.3),
                                );
                              }
                            }),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
