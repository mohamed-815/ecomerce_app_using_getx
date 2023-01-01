import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/locationdetails/bookinglocation.dart';

import 'package:orands_fish_booking/cart/cart.dart';

import 'package:orands_fish_booking/cart/placeordercontroller.dart';
import 'package:orands_fish_booking/cart/widgets/paytile.dart';
import 'package:orands_fish_booking/cart/widgets/radio.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/locationmodel.dart';
import 'package:orands_fish_booking/orderpage.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

LocationDetail? locationdetails;
final PlaceOrderController placeordercontroller =
    Get.put(PlaceOrderController());

class placeOrderhere extends StatelessWidget {
  placeOrderhere({super.key, required this.total});

  double total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CartHeadingbblack(title1: 'Checkout'),
                StreamBuilder(
                    stream: LocationStream(),
                    builder: (context, snapshot) {
                      locationdetails = snapshot.data;

                      return Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Shipping data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                GestureDetector(
                                  onTap: () => Get.defaultDialog(
                                      content:
                                          Flexible(child: BookingLocation())),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(.1),
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            khieght,
                            Row(
                              children: [
                                smalltextboldWidjets(Title: 'Location'),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  padding: EdgeInsets.only(left: 2.h),
                                  width: 250.w,
                                  child: Text(
                                      ' ${locationdetails == null ? 'place' : locationdetails?.place},${locationdetails == null ? 'city' : locationdetails?.city},pin:${locationdetails == null ? 'Enter Pin' : locationdetails?.pincode}, Mob: ${locationdetails == null ? 'Mobile no' : locationdetails?.mobileno}.',
                                      maxLines: 5,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: 20)),
                                )
                              ],
                            ),
                          ]),
                        ),
                      );
                    }),
                khieght,
                Row(
                  children: [smalltextboldWidjetsblack(Title: 'Just Pay It.')],
                ),
                khieght,
                khieght,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<PlaceOrderController>(
                          init: PlaceOrderController(),
                          builder: (c) {
                            return ListTile(
                              // contentPadding: EdgeInsets.all(.5),
                              leading: Image.asset(
                                'assets/accessories/unnamed.jpg',
                              ),
                              title: PayText(data: 'Razorpay'),
                              trailing: radioButton(
                                value: 1,
                                onChange: (value) {
                                  c.changingvaleu(value!);
                                },
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                khieght,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<PlaceOrderController>(
                          init: PlaceOrderController(),
                          builder: (c) {
                            return Razortile(
                                c: c,
                                image1: 'assets/accessories/download.jpg',
                                text1: 'Cash On Delivey');
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Khieght4(),
          StreamBuilder(
              stream: LocationStream(),
              builder: (context, snapshot) {
                final locatiodetails = snapshot.data;
                return GestureDetector(
                  onTap: () {
                    if (locatiodetails != null) {
                      if (placeordercontroller.basevaleu.value == 1) {
                        openCheckout(total: total);
                        Get.to(Order());
                      } else {
                        Addingtoorderlist();

                        Get.snackbar('Order Detail', 'Succcessfull');
                        Get.to(Order());
                      }
                    } else {
                      Get.snackbar('Location Information',
                          'Please Fill The Shipping Information');
                    }
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(7),
                      height: 60.h,
                      color: Colors.black,
                      child: Card(
                        color: Colors.white,
                        child: Center(
                            child: Textwidgrtblack(title1: 'PLACE ORDER')),
                      ),
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}
