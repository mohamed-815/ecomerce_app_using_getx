import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/bookinglocation.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class placeOrderhere extends StatelessWidget {
  const placeOrderhere({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          BackBotton(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                khieght,
                CartHeading(title1: 'Checkout'),
                khieght,
                Card(
                  color: Color.fromARGB(255, 211, 207, 207),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('shipping information'),
                          GestureDetector(
                            onTap: () => Get.to(BookingLocation()),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          smalltextboldWidjets(Title: 'Location'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          kwidth,
                          Text(' vengad,malappuram,pin:679338')
                        ],
                      ),
                    ]),
                  ),
                ),
                khieght,
                Row(
                  children: [
                    Text(' Select  your payment  Method  here'),
                  ],
                ),
                khieght,
                khieght,
                khieght,
                khieght,
                khieght,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      kwidth,
                      Image.asset('assets/Paypal.png'),
                      Image.asset('assets/Group 5.png'),
                      kwidth,
                      kwidth,
                    ],
                  ),
                )
              ],
            ),
          ),
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          khieght,
          Card(
            child: Container(
              padding: EdgeInsets.all(7),
              height: 60.h,
              color: Colors.black,
              child: Card(
                color: Colors.white,
                child: Center(child: Textwidgrt(title1: 'PLACE ORDER')),
              ),
            ),
          )
        ],
      )),
    );
  }
}
