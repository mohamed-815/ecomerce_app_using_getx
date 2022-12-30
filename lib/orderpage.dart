import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/cart/placeordercontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/ordermodelclass.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/widjets/notfoundmsg.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.3),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          ListView(
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
                      return CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ],
      )),
    );
  }

  Column Ordertile(List<OrderModel> orderlistuser, List<OrderModel> orderlist) {
    return Column(
      children: orderlistuser
          .map((e) => GestureDetector(
                onTap: () {
                  ModelProduct item = ModelProduct(
                      description: e.description,
                      name: e.name,
                      category: e.category,
                      minno: e.minno,
                      price: e.price,
                      size: e.size,
                      imagelist: e.imagelist,
                      id: e.id);

                  Get.to(ItemShowingScreen(itemdetail: item));
                },
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(
                    color: Colors.white.withOpacity(.1),
                    child: Stack(
                      children: [
                        Image.network(
                          width: double.infinity,
                          height: 150.h,
                          "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 150.h,
                          color: Colors.black.withOpacity(.5),
                        ),
                        Container(
                            width: double.infinity,
                            height: 150.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 120.h,
                                  width: 120.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(orderlist == null
                                              ? 'https://img.freepik.com/premium-vector/goldfish-illustration_1366-904.jpg?w=2000'
                                              : e.imagelist![0]))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 28.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      orderlist == null
                                          ? Container(
                                              child: smalltextboldWidjets25(
                                                  Title: 'ddd'))
                                          : Container(
                                              width: 80.w,
                                              child: smalltextboldWidjets25(
                                                  Title: e.name.toString()),
                                            ),
                                      Text(
                                        orderlist == null
                                            ? '....ps'
                                            : '${e.minnomultiple.toString()} Ps',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        orderlist == null
                                            ? '500rs'
                                            : '${e.subtotalprice.toString()} Rs',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    e.orderstatus == null
                                        ? buttonNew(
                                            color:
                                                Color.fromARGB(255, 86, 9, 3),
                                            data: 'Remove',
                                            onpress: () {
                                              Reject(e.id);
                                            })
                                        : e.orderstatus == 'yes'
                                            ? buttonNew(
                                                color: Colors.green,
                                                data: 'Shipped(✓)',
                                                onpress: () {
                                                  Get.snackbar(
                                                      'Shipping Details',
                                                      'Order Shipped');
                                                })
                                            : buttonNew(
                                                color: Colors.red,
                                                data: 'Rejected (❌)',
                                                onpress: () {})
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class buttonNew extends StatelessWidget {
  buttonNew({
    required this.color,
    required this.data,
    this.onpress,
    Key? key,
  }) : super(key: key);
  void Function()? onpress;
  Color color;
  String data;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onpress,
        child: SizedBox(
            width: 100, child: Center(child: Text(data == null ? '' : data))));
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
