import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/birds/birdscontroller.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/cart/cartmodel.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/edibleseeds/edible.dart';
import 'package:orands_fish_booking/itemshowingwcreen/ItemshowingController.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';
import 'package:orands_fish_booking/itemshowingwcreen/widgets/widgets.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

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
                    "https://images.pexels.com/photos/3133396/pexels-photo-3133396.jpeg?cs=srgb&dl=pexels-valeriia-miller-3133396.jpg&fm=jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.9),
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
                      khieght,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextOnly5(
                                  title1: itemdetail == null
                                      ? 'oops'
                                      : ' ${itemdetail.name}',
                                ),
                                PcCard(
                                    title: itemdetail == null
                                        ? 'oops'
                                        : itemdetail.price.toString()),
                              ],
                            ),
                            khieght,
                            khieght,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Pccardadd(
                                    title: itemdetail == null
                                        ? '100'
                                        : 'min ${itemdetail.minno.toString()} ps'),
                                CardAddCart(
                                  title: "add to cart",
                                ),
                              ],
                            ),
                            khieght,
                            khieght,
                            khieght,
                            Column(
                              children: [
                                GreyText(
                                  title: 'Description',
                                ),
                                Text(
                                  itemdetail.description,
                                  //  "min 100 pc,\nOnly .2 inche size is available,\nseeds must be contitioned before puting in to the pond",
                                  style: TextStyle(color: Colors.grey),
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
                        GetBack1(),
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
}
