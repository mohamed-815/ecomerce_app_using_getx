import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/locationdetails/bookinglocation.dart';

import 'package:orands_fish_booking/cart/cart.dart';

import 'package:orands_fish_booking/cart/placeordercontroller.dart';
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
          Row(
            children: [
              kwidth,
              backbutton1(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                khieght,
                CartHeading(title1: 'Checkout'),
                khieght,
                StreamBuilder(
                    stream: LocationStream(),
                    builder: (context, snapshot) {
                      locationdetails = snapshot.data;

                      return Card(
                        color: Color.fromARGB(255, 48, 47, 47),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'shipping information',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(BookingLocation()),
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
                                smalltextboldWidjetswhite(Title: 'Location'),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  width: 250.w,
                                  child: Text(
                                      ' ${locationdetails == null ? 'place' : locationdetails?.place},${locationdetails == null ? 'city' : locationdetails?.city},pin:${locationdetails == null ? 'Enter Pin' : locationdetails?.pincode}, Mob: ${locationdetails == null ? 'Mobile no' : locationdetails?.mobileno}.',
                                      maxLines: 5,
                                      style: TextStyle(
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
                  children: [
                    smalltextboldWidjets(
                        Title: ' Select  your payment  Method  here')
                  ],
                ),
                khieght,
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
                              title: PayText(data: 'Razorpaty'),
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
                            return ListTile(
                                leading: Image.asset(
                                  'assets/accessories/download.jpg',
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                title: PayText(
                                  data: 'Cash On Delivey',
                                ),
                                trailing: radioButton(
                                  value: 2,
                                  onChange: (value) {
                                    c.changingvaleu(value!);
                                  },
                                ));
                          }),
                    ),
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
          StreamBuilder(
              stream: LocationStream(),
              builder: (context, snapshot) {
                final locatiodetails = snapshot.data;
                return GestureDetector(
                  onTap: () {
                    if (locatiodetails != null) {
                      if (placeordercontroller.basevaleu.value == 1) {
                        openCheckout(total: total);
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
                        child: Center(child: Textwidgrt(title1: 'PLACE ORDER')),
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

class PayText extends StatelessWidget {
  PayText({
    required this.data,
    Key? key,
  }) : super(key: key);
  String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
    );
  }
}

class radioButton extends StatelessWidget {
  radioButton({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  int value;
  void Function(int?)? onChange;
  @override
  Widget build(BuildContext context) {
    return GetX<PlaceOrderController>(
        init: PlaceOrderController(),
        builder: (c) {
          return Radio(
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: value,
              groupValue: c.basevaleu.value,
              onChanged: onChange);
        });
  }
}
