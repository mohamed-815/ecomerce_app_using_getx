import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/itemlistinglist.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/presentation/home/widgets/scafold_back.dart';

import 'package:orands_fish_booking/app_module/classes/order_model/ordermodelclass.dart';

import 'package:orands_fish_booking/app_module/presentation/order_page/widgets/ordertile.dart';
import 'package:orands_fish_booking/app_module/presentation/search/widjets/notfoundmsg.dart';

class Order extends StatelessWidget {
  Order({this.formapage, super.key});
  String? formapage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          ScafoldBackGroundImage(
              image:
                  "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4"),
          const ScafoldBackGroundColor(),
          ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: formapage == 'yes'
                        ? const backbutton2()
                        : const SizedBox(),
                  ),
                  kwidth4,
                  kwidth4,
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
                      return Text('some thing went wrong');
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
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
