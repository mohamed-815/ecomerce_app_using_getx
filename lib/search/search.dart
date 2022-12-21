import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/fav.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/cartmodel.dart';
import 'package:orands_fish_booking/model/favmodel.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/searchcontroller.dart';
import 'package:orands_fish_booking/search/widjets/notfoundmsg.dart';
import 'package:orands_fish_booking/search/widjets/search_textform.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/common_textform.dart';
import 'package:orands_fish_booking/widgetscommon/typeitem.dart';

class Search extends StatelessWidget {
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (c) {
              return Column(
                children: [
                  Container(
                    //height: shieght / 16,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: TextFieldSearch(
                        c: c,
                        controller1: c.controller.value,
                        hint: 'Search Here',
                        lebel: ' Search'),
                  ),
                  khieght,
                  khieght,
                  StreamBuilder(
                      stream: showTheList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            'some Thing went wrong',
                            style: TextStyle(fontSize: 20),
                          ));
                        }

                        if (snapshot.hasData) {
                          c.searchlist = snapshot.data!;

                          return c.controller.value.text.isNotEmpty
                              ? c.finalsearchlist.isNotEmpty
                                  ? StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      children: List.generate(
                                          c.finalsearchlist.length, (index) {
                                        final item = c.finalsearchlist[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(ItemShowingScreen(
                                                itemdetail: item));
                                          },
                                          child: StaggeredItem(
                                            isfromtotal: 'no',
                                            item: item,
                                            shieght: shieght,
                                            swidth: swidth,
                                            index: index,
                                          ),
                                        );
                                      }),
                                    )
                                  : Center(
                                      child: SearchHelper(
                                          image:
                                              'https://thumbs.gfycat.com/ClosedImaginativeAmphiuma-size_restricted.gif',
                                          title: 'ooOps'))
                              : Center(
                                  child: SearchHelper(
                                      image:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ1Kofkn0SvQ1x3e3mUBE6L5kS8SlWrhuX-197MeIqp5OqoaqNhSgjmkpClqMbAvsy6_o&usqp=CAU',
                                      title: 'Search It'));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })
                ],
              );
            }),
      )),
    );
  }
}

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
    return Container(
      height: index % 2 == 0 ? 170.h : 265.h,
      child: Card(
        child: Stack(
          children: [
            Container(
              // height: shieght / 5,

              //margin: EdgeInsets.all(3),
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

                    // child: Image.asset(
                    //   image,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  khieght8,
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            smalltextboldWidjets25black(Title: item.name),
                          ],
                        ),
                        Row(
                          children: [
                            StaggeredItemText(item: '${item.price} rs')
                          ],
                        ),
                        Row(
                          children: [
                            StaggeredItemText(item: 'min ${item.minno} ps'),
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
                  Get.to(CartPage());
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
                                .where((element) => element.oldid == item.id)
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
                                      //  addingTofav(itemdetail);

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
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class StaggeredItemText extends StatelessWidget {
  StaggeredItemText({
    Key? key,
    required this.item,
  }) : super(key: key);

  String item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: TextStyle(
        color: Color.fromARGB(255, 27, 25, 25),
      ),
    );
  }
}

Stream<List<ModelProduct>> showTheList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('allproducts')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
