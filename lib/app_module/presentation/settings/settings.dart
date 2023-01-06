import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/order_page/orderpage.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/classes/profile_model/profilemodel.dart';

import 'package:orands_fish_booking/app_module/presentation/settings/profile.dart';
import 'package:orands_fish_booking/app_module/presentation/settings/widgets/profiledetailshowwidget.dart';
import 'package:orands_fish_booking/app_module/presentation/settings/widgets/settingscard.dart';

class Settings1 extends StatelessWidget {
  const Settings1({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDetail? p;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          khieght,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  kwidth,
                  kwidth,
                  const Icon(
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
                onTap: () async {
                  AuthController.instance.googlesignout();
                  AuthController.instance.logOut();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      const Text(
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
              StreamBuilder(
                  stream: ProfileStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return AddingProfileDetail(p);
                    }
                    if (snapshot.hasData) {
                      final profiledetail = snapshot.data;
                      return AddingProfileDetail(profiledetail);
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                      ));
                    }
                  }),
              GestureDetector(
                onTap: () {
                  Get.to(Order(
                    formapage: 'yes',
                  ));
                },
                child: Row(
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.indeterminate_check_box_sharp),
                        const Text('orders')
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
              const Devider1(),
              const Devider1(),
              const AccountSettings(),
              khieght,
              // GestureDetector(
              //   onTap: () => Get.to(() =>const ChangePassword()),
              //   child: CarttileSettings(
              //     data: 'Change Password',
              //   ),
              // ),
              GestureDetector(
                onTap: () => Get.defaultDialog(
                    title: '', content: EditProfile(), radius: 10.0),

                //   Get.to(() => Profile()),

                child: StreamBuilder(
                    stream: ProfileStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return CarttileSettings(data: 'Add Profile');
                      }
                      if (snapshot.hasData) {
                        final item = snapshot.data;
                        print(item.toString());
                        return item?.name == null
                            ? CarttileSettings(data: 'Add Profile')
                            : CarttileSettings(data: 'Edit Profile');
                      } else {
                        return const CircularProgressIndicator(
                          color: Colors.black,
                        );
                      }
                    }),
              ),
              const Card(
                  child: ListTile(
                leading: Text('Add a payment method'),
                trailing: Icon(Icons.add),
              ))
            ]),
          ),
          khieght,
          const More(),
          khieght,
          GestureDetector(
            // onTap: () => Get.to(() => BookingLocation()),
            child: CarttileSettings(data: 'About Us'),
          ),
          CarttileSettings(data: 'Privacy And Policy'),
          CarttileSettings(data: 'Terms And Conditions'),
        ]),
      )),
    );
  }
}

class Devider1 extends StatelessWidget {
  const Devider1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
