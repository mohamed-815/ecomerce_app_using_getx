import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/cartmodel.dart';

class Addingcard extends StatelessWidget {
  Addingcard({
    required this.id,
    required this.itemdetail,
    Key? key,
  }) : super(key: key);

  String id;
  CartModel itemdetail;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 34.w,
      right: 13.w,
      child: Card(
        elevation: 2.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: const Color.fromARGB(255, 216, 214, 214).withOpacity(.1),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Addingmore(id, itemdetail);
              },
              child: Card(
                  color: const Color.fromARGB(255, 23, 23, 23),
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
            ),
            GestureDetector(
              onTap: () {
                RemoveThings(id, itemdetail);
              },
              child: Card(
                  color: const Color.fromARGB(255, 6, 6, 6),
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
