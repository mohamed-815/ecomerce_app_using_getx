import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/cart/placeordercontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/ordermodelclass.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: backbutton2(),
              ),
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
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

                  return Column(
                    children: orderlistuser
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white.withOpacity(.1),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: Container(
                                    width: 80,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              orderlist == null
                                                  ? 'https://media.istockphoto.com/id/1368239780/photo/clown-fish.jpg?b=1&s=170667a&w=0&k=20&c=mBdC45x6navTxLRmA7_k7srPFGvbQmaBf6HINhwkE-Q='
                                                  : e.imagelist?[0],
                                            )),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  title: Text(
                                    orderlist == null ? 'Nill..' : e.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    orderlist == null
                                        ? '100ps'
                                        : '${e.minnomultiple.toString()}Ps',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        orderlist == null
                                            ? '100Rs'
                                            : '${e.subtotalprice.toString()}Rs',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Reject(e.id);
                                        },
                                        child: Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('some thing went wrong');
                } else {
                  return CircularProgressIndicator();
                }
              })
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
