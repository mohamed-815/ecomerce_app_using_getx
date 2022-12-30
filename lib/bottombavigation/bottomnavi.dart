import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:orands_fish_booking/favorite.dart/favorite.dart';
import 'package:orands_fish_booking/bottombavigation/bottomcontroller.dart';
import 'package:orands_fish_booking/cart/cart.dart';

import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/offer/offer.dart';
import 'package:orands_fish_booking/orderpage.dart';
import 'package:orands_fish_booking/widgetscommon/listitem.dart';

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
                image: DecorationImage(
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
                    activeColor: Color.fromARGB(255, 53, 50, 50),
                    iconSize: 18.sm,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Color.fromARGB(255, 37, 36, 36),
                    color: Color.fromARGB(255, 40, 39, 39),
                    tabs: [
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
                          icon: LineIcons.productHunt,
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
