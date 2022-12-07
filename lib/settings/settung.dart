import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/cart/bookinglocation.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/orderpage.dart';
import 'package:orands_fish_booking/settings/changepassword.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.3),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          khieght,
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  kwidth,
                  kwidth,
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  kwidth,
                  SettingText(
                    title1: 'Settings',
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  AuthController.instance.googlesignout();
                  AuthController.instance.logOut();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          khieght,
          khieght,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  kwidth,
                  kwidth,
                  kwidth,
                  kwidth,
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Moor_color_change.jpg'),
                    // child: Image.asset(
                    //   'assets/Moor_color_change.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  kwidth,
                  Text(
                    'naveen',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Order());
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.indeterminate_check_box_sharp),
                        Text('orders')
                      ],
                    ),
                    kwidth
                  ],
                ),
              ),
            ],
          ),
          khieght,
          khieght,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  kwidth,
                  kwidth,
                  kwidth,
                  kwidth,
                  GreyText(title: 'Account Settings'),
                  kwidth,
                ],
              ),
              khieght,
              Row(
                children: [
                  kwidth,
                  smalltextboldWidjets(Title: 'Edit profile'),
                  kwidth,
                ],
              ),
              GestureDetector(
                onTap: () => Get.to(() => ChangePassword()),
                child: Card(
                  child: ListTile(
                    leading: Text('Change password'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => Profile()),
                child: Card(
                  child: ListTile(
                    leading: Text('Edit Profile'),
                  ),
                ),
              ),
              Card(
                  child: ListTile(
                leading: Text('Add a payment method'),
                trailing: Icon(Icons.add),
              ))
            ]),
          ),
          khieght,
          Row(
            children: [
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              GreyText(title: 'More'),
              kwidth,
            ],
          ),
          khieght,
          GestureDetector(
            // onTap: () => Get.to(() => BookingLocation()),
            child: Card(
              child: ListTile(
                leading: Text('About us'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text('Privacy and Policy'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text('Terms and Conditions'),
            ),
          ),
        ]),
      )),
    );
  }
}

class GreyText extends StatelessWidget {
  GreyText({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Colors.grey),
    );
  }
}

class GreyText1 extends StatelessWidget {
  GreyText1({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Color.fromARGB(255, 223, 220, 220)),
    );
  }
}
