import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:orands_fish_booking/accessories/Accessories.dart';
import 'package:orands_fish_booking/aquariumfishes/aquariumfishes.dart';
import 'package:orands_fish_booking/birds/birds.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/edibleseeds/edible.dart';
import 'package:orands_fish_booking/feeds/feeds.dart';
import 'package:orands_fish_booking/search/search.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
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
                          onTap: (() {
                            Get.to(() => Settings());
                          }),
                          child: const Icon(
                            Icons.menu,
                            size: 30,
                            color: Color.fromARGB(255, 30, 28, 28),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () => Get.to(() => Search()),
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
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return OfferContainer(
                                      image: 'assets/Moor_color_change.jpg',
                                      itemname: 'Gold fish',
                                      itemprice: '5rs',
                                      shieght: shieght,
                                      swidth: swidth,
                                      title1: 'min 100ps',
                                    );
                                  }),
                            ),
                            Row(
                              children: [
                                Textwidgrt(title1: "Offers in birds"),
                              ],
                            ),
                            Container(
                              height: Shieght(context) / 5.5,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return OfferContainer(
                                      image: 'assets/maxresdefault.jpg',
                                      itemname: 'Love birds',
                                      itemprice: '200rs',
                                      shieght: shieght,
                                      swidth: swidth,
                                      title1: 'min 10ps',
                                    );
                                  }),
                            ),
                            Row(
                              children: [
                                Textwidgrt(title1: "Offers in feeds"),
                              ],
                            ),
                            Container(
                              height: shieght / 5.5,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return OfferContainer(
                                      image:
                                          'assets/chicken-feed-pellets-1200x900.webp',
                                      itemname: 'poultry feed',
                                      itemprice: '20rs',
                                      shieght: shieght,
                                      swidth: swidth,
                                      title1: 'min 10Kg',
                                    );
                                  }),
                            ),
                            Row(
                              children: [
                                Textwidgrt(
                                  title1: "Items",
                                ),
                              ],
                            ),
                            khieght,
                            Container(
                              height: shieght / 1.4,
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 35.0,
                                mainAxisSpacing: 3,
                                children: List.generate(5, (index) {
                                  if (index == 0) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => EdibleSeeds(
                                            category: 'Edible Fishes',
                                          )),
                                      child: CategoryContainer(
                                          image:
                                              'assets/141ad8d639fd9bfedc719ec93a3b80ef.jpg',
                                          categoryname: 'Edible Fishes',
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }
                                  if (index == 1) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => AquariumFishes(
                                            category: 'Aquarium',
                                          )),
                                      child: CategoryContainer(
                                          image:
                                              'assets/cartoon-aquarium-fish-vector-1132116.jpg',
                                          categoryname: 'Aquarium',
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }
                                  if (index == 2) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => Accessories(
                                            titlelarge: 'Accessories',
                                          )),
                                      child: CategoryContainer(
                                          image:
                                              'assets/pet-shop-vet-store-set-domestic-animals-accessories-cat-dog-fish-cartoon-vector-food-toys-aid-bowl-shampoo-aquarium-240357678.jpg',
                                          categoryname: 'Accessories',
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }

                                  if (index == 3) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => Feeds(
                                            category: 'Feeds',
                                          )),
                                      child: CategoryContainer(
                                          image: 'assets/images.jpeg',
                                          categoryname: 'feeds',
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => Birds(
                                            titlelarge: 'birds',
                                          )),
                                      child: CategoryContainer(
                                          image: 'assets/images (1).jpeg',
                                          categoryname: 'Birds',
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }
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
        ));
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
                    child: Image.asset(
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
