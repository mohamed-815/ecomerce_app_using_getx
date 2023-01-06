import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/common_textform.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/classes/profile_model/profilemodel.dart';
import 'package:orands_fish_booking/app_module/controllers/settingscontroller.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController pnamecontroller = TextEditingController();
  final TextEditingController pmobcontroller = TextEditingController();
  final TextEditingController pshopcontroller = TextEditingController();
  final TextEditingController plocatiomcontroller = TextEditingController();

  EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                StreamBuilder(
                    stream: ProfileStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.white,
                        ));
                      }
                      if (snapshot.hasData) {
                        final profiledetail = snapshot.data;
                        return GetBuilder<SettingsController>(
                            init: SettingsController(),
                            builder: (c) {
                              return profiledetail?.photo != null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: c.webimage == null
                                          ? NetworkImage(profiledetail?.photo ==
                                                  null
                                              ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'
                                              : profiledetail!.photo!)
                                          : NetworkImage(c.webimage!),
                                    )
                                  : const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'),
                                    );
                            });
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.white,
                        ));
                      }
                    }),
                GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: (c) {
                      return Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                              onTap: () {
                                c.getImage(source: ImageSource.gallery);
                              },
                              child: const Icon(Icons.add_a_photo)));
                    }),
              ],
            ),
            khieght,
            khieght,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              //  height: shieght / 16,
              child: TextField1(
                hint: 'Name',
                lebel: 'Name',
                controller1: pnamecontroller,
                icon: Icons.data_thresholding,
              ),
            ),
            khieght,
            khieght,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField1(
                controller1: pmobcontroller,
                hint: '+14987889999',
                lebel: 'Phone Number',
                icon: Icons.call,
              ),
            ),
            khieght,
            khieght,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField1(
                controller1: pshopcontroller,
                hint: 'shop name',
                lebel: 'Enter shop name',
                icon: Icons.shop,
              ),
            ),
            khieght,
            khieght,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField1(
                controller1: plocatiomcontroller,
                hint: 'Location',
                lebel: 'Enter Location',
                icon: Icons.location_city,
              ),
            ),
            khieght,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder<SettingsController>(
                  init: SettingsController(),
                  builder: (c) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: SizedBox(
                          // width: 33.h,
                          height: 40.h,
                          child: const Center(child: Text('Done'))),
                      onPressed: () {
                        if (plocatiomcontroller.text.isNotEmpty &&
                            pmobcontroller.text.isNotEmpty &&
                            pnamecontroller.text.isNotEmpty &&
                            pshopcontroller.text.isNotEmpty) {
                          final profiledetail = ProfileDetail(
                              photo: c.webimage,
                              name: pnamecontroller.text,
                              location: plocatiomcontroller.text,
                              mobileno: pmobcontroller.text,
                              shopname: pshopcontroller.text);
                          addingToFireprof(profiledetail);

                          Get.back();
                        } else {
                          Get.snackbar(
                              'Profile Details', 'please complete the form');
                        }
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

addingToFireprof(ProfileDetail profieldetails) async {
  final adingtofirebase = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('profiledetail')
      .collection('profiledetail')
      .doc('profiledetail');

  final adingtofirebaseemail = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!);

  final json = profieldetails.toJson();

  await adingtofirebase.set(json);
  await adingtofirebaseemail.set({'name': email});
}

Stream<ProfileDetail> ProfileStream() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('profiledetail')
      .collection('profiledetail')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ProfileDetail.fromJson(doc.data()))
          .single);

  // .map((snapshot) =>
  //     snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
}
