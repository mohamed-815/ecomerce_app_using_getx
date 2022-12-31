import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orands_fish_booking/cart/cart.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/model/cart,ordermodels/cartmodel.dart';

class CartTile extends StatelessWidget {
  CartTile({
    required this.total,
    required this.id,
    required this.carttiledetail,
    Key? key,
  }) : super(key: key);

  double total;
  String id;
  CartModel carttiledetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          khieght,
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(
                      carttiledetail.imagelist![0],
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                ),

                // margin: EdgeInsets.symmetric(horizontal: 1),
                height: 140.h,
                width: 325.h,
              ),
              Addingcard(id: id, itemdetail: carttiledetail),
              Positioned(
                bottom: 70.w,
                left: 13.w,
                child: NumberCard1(title: '${carttiledetail.minnomultiple}ps'),
              ),
              Positioned(
                bottom: 10.w,
                left: 13.w,
                child: NumberCard1(title: carttiledetail.name),
              ),
              Positioned(
                bottom: 7.w,
                right: 23.w,
                child: GestureDetector(
                  onTap: () {
                    deleteItem(id);
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          khieght,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NumberCard1(title: '${carttiledetail.subtotalprice}rs'),
            ],
          ),
          khieght,
        ],
      ),
    );
  }
}
