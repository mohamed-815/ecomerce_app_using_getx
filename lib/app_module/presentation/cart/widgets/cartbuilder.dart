import 'package:flutter/material.dart';

import 'package:orands_fish_booking/app_module/classes/cart_model/cartmodel.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/cart.dart';
import 'package:orands_fish_booking/app_module/presentation/cart/widgets/carttile.dart';

class OfferBuilder extends StatelessWidget {
  OfferBuilder({
    required this.stream1,
    Key? key,
  }) : super(key: key);
  Stream<List<CartModel>> stream1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream1,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something Wrong');
          }
          if (snapshot.hasData) {
            final cartlist = snapshot.data!;
            ca.valeusetingzero();
            for (var e in cartlist) {
              ca.valeuseting(e.subtotalprice);
            }

            print(ca.total.toString());
            return Column(
              children: cartlist
                  .map((e) => CartTile(
                        id: e.id,
                        carttiledetail: e,
                        total: ca.total,
                      ))
                  .toList(),
            );
          } else {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
        });
  }
}
