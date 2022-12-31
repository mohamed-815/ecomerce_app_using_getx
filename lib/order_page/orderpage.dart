import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/const/const.dart';

// import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/widgets/scafold_back.dart';

import 'package:orands_fish_booking/model/cart,ordermodels/ordermodelclass.dart';

import 'package:orands_fish_booking/order_page/widgets/ordertile.dart';
import 'package:orands_fish_booking/search/widjets/notfoundmsg.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/back_button.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          ScafoldBackGroundImage(
            image:
                "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4",
          ),
          const ScafoldBackGroundColor(),
          ListView(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: backbutton1(),
                  ),
                  kwidth,
                  Center(child: CartHeading1(title1: 'Orders'))
                ],
              ),
              khieght,
              StreamBuilder(
                  stream: showTheorderList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final orderlist = snapshot.data;
                      final orderlistuser = orderlist!
                          .where(
                            (element) => element.email == email,
                          )
                          .toList();

                      return orderlistuser.isNotEmpty
                          ? Ordertile(orderlistuser, orderlist)
                          : Column(
                              children: [
                                khieght,
                                khieght,
                                Center(
                                    child: SearchHelper(
                                        image:
                                            'https://media.tenor.com/wrtECiLMZ_MAAAAC/shark-dancing.gif',
                                        title: 'Please Add Some.')),
                              ],
                            );
                    } else if (snapshot.hasError) {
                      return const Text('some thing went wrong');
                    } else {
                      return const CircularProgressIndicator(
                        color: Colors.black,
                      );
                    }
                  })
            ],
          ),
        ],
      )),
    );
  }
}

Stream<List<OrderModel>> showTheorderList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('orders')
      .collection('orderlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList());
}

Reject(String id) async {
  final fireremove = FirebaseFirestore.instance
      .collection('collection')
      .doc('orders')
      .collection('orderlist')
      .doc(id);

  await fireremove
      .delete()
      .then((value) => Get.snackbar('Remove', 'Remove Successfully'));
}
