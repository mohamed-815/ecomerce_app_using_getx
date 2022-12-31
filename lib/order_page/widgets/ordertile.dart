import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/ordermodelclass.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/order_page/orderpage.dart';
import 'package:orands_fish_booking/order_page/widgets/order_button.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    orderlist == null
                                        ? SizedBox(
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
                                          color: Color.fromARGB(255, 86, 9, 3),
                                          data: 'Remove',
                                          onpress: () {
                                            Reject(e.id);
                                          })
                                      : e.orderstatus == 'yes'
                                          ? buttonNew(
                                              color: Colors.green,
                                              data: 'Shipped(✓)',
                                              onpress: () {
                                                Get.snackbar('Shipping Details',
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
