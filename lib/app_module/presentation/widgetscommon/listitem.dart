import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/cart.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/classes/cart_model/cartmodel.dart';
import 'package:orands_fish_booking/app_module/classes/fav_model/favmodel.dart';
import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';
import 'package:orands_fish_booking/app_module/classes/fav.dart';

class SimpleItem extends StatelessWidget {
  SimpleItem({
    required this.itemdetail,
    required this.title1,
    required this.title2,
    required this.image,
    required this.itemname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;
  FavModel itemdetail;
  String? itemname;
  String? title1;
  String? title2;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: swidth / 2.3,
          padding: EdgeInsets.all(8),
          //margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: NetworkImage(image!), fit: BoxFit.cover)),
                height: shieght / 7,
                width: swidth / 1.5,

                // child: Image.asset(
                //   image,
                //   fit: BoxFit.cover,
                // ),
              ),
              khieght8,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 130.w,
                            child: smalltextboldWidjets25(Title: itemname!)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${title1!} rs',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          itemdetail.category != 'feeds'
                              ? 'min ${title2!} ps'
                              : 'min ${title2!} kg',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 40,
          child: GestureDetector(
            onTap: () {
              final ModelProduct cartadditem = ModelProduct(
                  id: itemdetail.id,
                  isfave: itemdetail.isfave,
                  imagelist: itemdetail.imagelist,
                  description: itemdetail.description,
                  name: itemdetail.name,
                  category: itemdetail.category,
                  minno: itemdetail.minno,
                  price: itemdetail.price,
                  size: itemdetail.size);

              addingToCart(cartadditem);
              Get.snackbar('Cart', 'Added to cart');
              Get.to(CartPage(
                formapage: 'yes',
              ));
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white.withOpacity(.3),
              child: Icon(
                Icons.shopping_cart,
                size: 18,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        ),
        Positioned(
            top: 15,
            left: 16,
            child: GestureDetector(
              onTap: () {
                //  addingTofav(itemdetail);

                deleteFromFav(itemdetail.id);
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white.withOpacity(.3),
                child: Icon(
                  Icons.favorite,
                  size: 18,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
            )),
      ],
    );
  }
}

Stream<List<FavModel>> listOfFavStream() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email)
      .collection('userdetails')
      .doc('favlist')
      .collection('favlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => FavModel.fromJson(doc.data())).toList());
}
