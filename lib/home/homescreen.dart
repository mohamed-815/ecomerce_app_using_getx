import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:orands_fish_booking/accessories/Accessories.dart';

import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/search.dart';

import 'package:orands_fish_booking/widgets/heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Stream<List<ModelProduct>> showTheoriginalOfferList() {
    return FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('offerlist')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ModelProduct.fromJson(doc.data()))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Swidth(context);
      Shieght(context);
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 227, 227),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white.withOpacity(.1),
            child: Stack(
              children: [
                Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 87, 138, 177),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100))),
                ),
                Positioned(
                  bottom: 400.h,
                  child: Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 87, 138, 177),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Get.to(() => Settings());
                        },
                        child: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Color.fromARGB(255, 30, 28, 28),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          // Get.to(() => Search());
                          showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Color.fromARGB(115, 24, 22, 22),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (BuildContext buildContext,
                                  Animation animation,
                                  Animation secondaryAnimation) {
                                return Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        width: 340.w,
                                        height: 700.h,
                                        margin: EdgeInsets.only(
                                            top: 100, bottom: 40),
                                        padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
                                        child: Search(),
                                      ),
                                      Positioned(
                                          top: 33.h,
                                          left: 109.w,
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundImage: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbGrm3C3QgWyL0mk3GbQ6JC36t_w1G9VzAww&usqp=CAU'),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.5),
                          child: const Center(
                              child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 36, 35, 35),
                            size: 18,
                          )),
                        ),
                      ),
                    ),
                    khieght,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textwidgrt(
                                title1: "Offers in aquarium",
                              ),
                              GestureDetector(
                                onTap: () => Get.to(CartPage()),
                                child: CircleAvatar(
                                  child: Icon(Icons.shopping_basket),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: shieght / 5.5,
                            child: StreamBuilder(
                                stream: showTheoriginalOfferList(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                        child: CartHeading(
                                            title1: 'Something wrong'));
                                  }
                                  if (snapshot.hasData) {
                                    final list = snapshot.data!;
                                    final aqofferlist = list
                                        .where((element) =>
                                            element.category == 'aquarium')
                                        .toList();

                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        // shrinkWrap: true,
                                        itemCount: aqofferlist.length,
                                        itemBuilder: (context, index) {
                                          final offeritem = aqofferlist[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(ItemShowingScreen(
                                                  itemdetail: offeritem));
                                            },
                                            child: OfferContainer(
                                              image: offeritem.imagelist![0],
                                              itemname: offeritem.name,
                                              itemprice: '${offeritem.price}rs',
                                              shieght: shieght,
                                              swidth: swidth,
                                              title1:
                                                  'min ${offeritem.minno}ps',
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ));
                                  }
                                }),
                          ),
                          Row(
                            children: [
                              Textwidgrt(title1: "Offers in birds"),
                            ],
                          ),
                          Container(
                            height: Shieght(context) / 5.5,
                            child: StreamBuilder(
                                stream: showTheoriginalOfferList(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                        child: CartHeading(
                                            title1: 'Something wrong'));
                                  }
                                  if (snapshot.hasData) {
                                    final list = snapshot.data!;
                                    final offerlist = list
                                        .where((element) =>
                                            element.category == 'birds')
                                        .toList();

                                    return offerlist.length != 0
                                        ? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            // shrinkWrap: true,
                                            itemCount: offerlist.length,
                                            itemBuilder: (context, index) {
                                              final offeritem =
                                                  offerlist[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(ItemShowingScreen(
                                                      itemdetail: offeritem));
                                                },
                                                child: OfferContainer(
                                                  image: offeritem
                                                              .imagelist?[0] ==
                                                          null
                                                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmtF4VdOl8_m-1FayEemKpgZvDuvgHOqAhFQ&usqp=CAU'
                                                      : offeritem.imagelist?[0],
                                                  itemname: offeritem.name,
                                                  itemprice:
                                                      '${offeritem.price}rs',
                                                  shieght: shieght,
                                                  swidth: swidth,
                                                  title1:
                                                      'min ${offeritem.minno}ps',
                                                ),
                                              );
                                            })
                                        : Center(
                                            child: Textwidgrt(
                                                title1: 'No Offers'));
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ));
                                  }
                                }),
                          ),
                          Row(
                            children: [
                              Textwidgrt(title1: "All Offers"),
                            ],
                          ),
                          Container(
                              height: shieght / 5.5,
                              child: StreamBuilder(
                                  stream: showTheoriginalOfferList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                          child: CartHeading(
                                              title1: 'Something wrong'));
                                    }
                                    if (snapshot.hasData) {
                                      final list = snapshot.data!;

                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          // shrinkWrap: true,
                                          itemCount: list.length,
                                          itemBuilder: (context, index) {
                                            final offeritem = list[index];
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(ItemShowingScreen(
                                                    itemdetail: offeritem));
                                              },
                                              child: OfferContainer(
                                                image: offeritem.imagelist![0],
                                                itemname: offeritem.name,
                                                itemprice:
                                                    '${offeritem.price}rs',
                                                shieght: shieght,
                                                swidth: swidth,
                                                title1:
                                                    'min ${offeritem.minno}ps',
                                              ),
                                            );
                                          });
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ));
                                    }
                                  })),
                          Row(
                            children: [
                              Textwidgrt(
                                title1: "Items",
                              ),
                            ],
                          ),
                          khieght,
                          Container(
                            height: shieght / 1.6,
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 35.0,
                              mainAxisSpacing: 3,
                              children: List.generate(5, (index) {
                                final tocategory = categorylist[index];

                                return GestureDetector(
                                  onTap: () => Get.to(() => Accessories(
                                        category: tocategory.categoryname,
                                        titlelarge: tocategory.categoryheading,
                                      )),
                                  child: CategoryContainer(
                                      image: tocategory.image,
                                      categoryname: tocategory.categoryheading,
                                      shieght: shieght,
                                      swidth: swidth),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OfferContainer extends StatelessWidget {
  OfferContainer({
    required this.image,
    required this.itemprice,
    required this.itemname,
    required this.title1,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;
  String title1;
  String itemprice;
  String itemname;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shieght / 6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7)),
                  height: shieght / 8,
                  width: swidth / 2.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     left: 6,
                //     child: Text(
                //       title1,
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                //     )),
              ],
            ),
          ),
          Row(
            children: [
              smalltextboldWidjets(
                Title: itemprice,
              ),
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              smalltextboldWidjets(Title: itemname)
            ],
          )
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    required this.image,
    required this.categoryname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;

  String categoryname;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shieght / 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
              height: shieght / 7,
              width: swidth / 3,
            ),
          ),
          smalltextboldWidjets(Title: categoryname)
        ],
      ),
    );
  }
}

class Categorydetails {
  String categoryname;
  String categoryheading;
  String image;
  Categorydetails(
      {required this.image,
      required this.categoryheading,
      required this.categoryname});
}

final categorylist = [
  Categorydetails(
      image: 'assets/141ad8d639fd9bfedc719ec93a3b80ef.jpg',
      categoryheading: 'Edible Fishes',
      categoryname: 'edibleseeds'),
  Categorydetails(
      image: 'assets/cartoon-aquarium-fish-vector-1132116.jpg',
      categoryheading: 'Aquarium',
      categoryname: 'aquarium'),
  Categorydetails(
      image:
          'assets/pet-shop-vet-store-set-domestic-animals-accessories-cat-dog-fish-cartoon-vector-food-toys-aid-bowl-shampoo-aquarium-240357678.jpg',
      categoryheading: 'Accessories',
      categoryname: 'accessories'),
  Categorydetails(
      image: 'assets/images.jpeg',
      categoryheading: 'Feeds',
      categoryname: 'feeds'),
  Categorydetails(
      image: 'assets/images (1).jpeg',
      categoryheading: 'Birds',
      categoryname: 'birds'),
];
