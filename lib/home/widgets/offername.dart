import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class OfferName extends StatelessWidget {
  OfferName({
    this.cartcircle,
    required this.name,
    this.icon,
    Key? key,
  }) : super(key: key);
  String name;
  IconData? icon;
  Widget? cartcircle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Textwidgrt(
          title1: name,
        ),
        cartcircle == null ? const SizedBox() : cartcircle!,
      ],
    );
  }
}

class CartCircle extends StatelessWidget {
  const CartCircle({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CartPage()),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 33, 25, 25),
        child: Icon(icon),
      ),
    );
  }
}
