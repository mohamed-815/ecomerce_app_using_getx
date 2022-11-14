import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/placeOrder.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/settung.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              BackBotton(),
              khieght,
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartHeading(title1: 'Cart'),
                        GreyText(title: '4 Item')
                      ],
                    ),
                    khieght,
                    Stack(
                      children: [
                        Container(
                            color: Colors.black,
                            // margin: EdgeInsets.symmetric(horizontal: 1),
                            height: 120.h,
                            width: 325.h,
                            child: Image.asset(
                              'assets/Moor_color_change.jpg',
                              fit: BoxFit.cover,
                            )),
                        Addingcard(),
                        Positioned(
                          bottom: 70.w,
                          left: 13.w,
                          child: NumberCard(title: '100ps'),
                        ),
                      ],
                    ),
                    khieght,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NumberCard(title: '500rs'),
                      ],
                    ),
                    khieght,
                    Stack(
                      children: [
                        Container(
                            color: Colors.black,
                            // margin: EdgeInsets.symmetric(horizontal: 1),
                            height: 120.h,
                            width: 325.h,
                            child: Image.asset(
                              'assets/Moor_color_change.jpg',
                              fit: BoxFit.cover,
                            )),
                        Addingcard(),
                        Positioned(
                          bottom: 70.w,
                          left: 13.w,
                          child: NumberCard(title: '100ps'),
                        ),
                      ],
                    ),
                    khieght,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NumberCard(title: '500rs'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 4.h,
            right: 8.w,
            left: 8.w,
            child: Card(
              color: Colors.black,
              child: Container(
                height: 50.h,
                //width: 200.h,
                //margin: EdgeInsets.symmetric(horizontal: 65.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: NumberCard(title: '500rs'),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => placeOrderhere()),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: NumberCard(title: 'Checkout')),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Addingcard extends StatelessWidget {
  const Addingcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 34.w,
      right: 13.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromARGB(255, 216, 214, 214),
        child: Column(
          children: [
            Card(
                color: Color.fromARGB(255, 216, 214, 214),
                child: Container(
                    margin: EdgeInsets.all(5), child: Icon(Icons.add))),
            Card(
                color: Color.fromARGB(255, 216, 214, 214),
                child: Container(
                    margin: EdgeInsets.all(5), child: Icon(Icons.remove)))
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
        color: Color.fromARGB(255, 216, 214, 214),
        child: Container(
            margin: EdgeInsets.all(10), child: Textwidgrt(title1: title)));
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
