import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:orands_fish_booking/app_module/controllers/bottomcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/favorite/favorite.dart';

import 'package:orands_fish_booking/app_module/presentation/cart/cart.dart';

import 'package:orands_fish_booking/app_module/presentation/home/homescreen.dart';
import 'package:orands_fish_booking/app_module/presentation/offer/offer.dart';
import 'package:orands_fish_booking/app_module/presentation/order_page/orderpage.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/listitem.dart';

class BottomNave extends StatelessWidget {
  BottomNave({super.key});

  final pages = [
    HomeScreen(),
    OfferPageView(),
    CartPage(),
    Favorite(
      titlelarge: 'Favorite',
      favoritedetail: listOfFavStream(),
    ),
    Order(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavController>(
        init: BottomNavController(),
        builder: (c) {
          return Scaffold(
            body: pages[c.curentintex.value],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/886/710/HD-wallpaper-fish-aquarium-beta-orange-red.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
                  child: GNav(
                    rippleColor: Colors.grey,
                    hoverColor: Colors.grey,
                    gap: 3.w,
                    activeColor: const Color.fromARGB(255, 53, 50, 50),
                    iconSize: 18.sm,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: const Color.fromARGB(255, 37, 36, 36),
                    color: const Color.fromARGB(255, 40, 39, 39),
                    tabs: const [
                      GButton(
                          icon: LineIcons.home,
                          text: 'Home',
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          iconActiveColor: Colors.white),
                      GButton(
                          icon: Icons.local_offer,
                          text: 'Offers',
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          iconActiveColor: Colors.white),
                      GButton(
                          icon: LineIcons.shoppingCart,
                          text: 'Cart',
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          iconActiveColor: Colors.white),
                      GButton(
                        icon: Icons.favorite,
                        text: 'Favorite',
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        iconActiveColor: Colors.white,
                      ),
                      GButton(
                          icon: Icons.category,
                          text: 'Orders',
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          iconActiveColor: Colors.white)
                    ],
                    selectedIndex: c.curentintex.value,
                    onTabChange: (index) {
                      c.changePage(index);
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
