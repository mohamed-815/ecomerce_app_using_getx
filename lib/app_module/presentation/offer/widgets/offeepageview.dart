import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/cart.dart';
import 'package:orands_fish_booking/app_module/presentation/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/app_module/classes/cart_model/cartmodel.dart';
import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';
import 'package:orands_fish_booking/app_module/presentation/offer/widgets/widget.dart';

class OfferItemshowwidget extends StatelessWidget {
  OfferItemshowwidget({required this.item, super.key});
  ModelProduct item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item.imagelist![0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              addingToCart(item);
              Get.snackbar('Cart', 'Added to cart');
              Get.to(CartPage(
                formapage: 'yes',
              ));
            },
            child: SafeArea(
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.shopping_cart)),
            ),
          ),
        ),
        Positioned(
          left: 30,
          bottom: 10,
          child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: Color.fromARGB(255, 27, 26, 26))))),
              onPressed: () {
                Get.to(ItemShowingScreen(itemdetail: item));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Explore It'),
              )),
        ),
        Positioned(
            left: 20.h,
            bottom: 350.h,
            child: OfferItemNameWidget(item: 'Name : ${item.name}')),
        Positioned(
            right: 30.h,
            bottom: 100.h,
            child: OfferItemNameWidget(item: 'Price : ${item.price}Rs')),
        Positioned(
            right: 30.h,
            bottom: 200.h,
            child: OfferItemNameWidget(item: 'Min : ${item.minno}Ps')),
      ],
    );
  }
}
