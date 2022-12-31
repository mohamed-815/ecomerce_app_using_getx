import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/settings/settingscontroller.dart';

final SettingsController s = Get.put(SettingsController());

class ProfileShow extends StatelessWidget {
  const ProfileShow({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ProfileStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Pls Add Profile Details.');
          }
          if (snapshot.hasData) {
            final profiledetail = snapshot.data;
            return Column(
              children: [
                Center(
                    child: Container(
                  child: CircleAvatar(
                    radius: 100,

                    backgroundImage: profiledetail?.photo == null
                        ? NetworkImage(s.webimage == null
                            ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'
                            : s.webimage!)
                        : NetworkImage(profiledetail!.photo!),
                    // child: ClipOval(
                    //   child: Image.file(
                    //     File(addController
                    //         .studentdata[index].imagePath),
                    //     height: 500,
                    //     width: 500,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                )),
                khieght,
                Center(
                    child: Text(
                        profiledetail == null
                            ? 'Enter Name'
                            : profiledetail.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ))),
                khieght,
                ProfileDetailLine(
                  Name1: 'mob : ',
                  Name2: profiledetail == null
                      ? 'mobile no'
                      : profiledetail.mobileno,
                ),
                khieght,
                ProfileDetailLine(
                    Name1: 'Shop Name : ',
                    Name2: profiledetail == null
                        ? 'Shop Name'
                        : profiledetail.shopname),
                khieght,
                ProfileDetailLine(
                  Name1: 'Location : ',
                  Name2: profiledetail == null
                      ? 'Location'
                      : profiledetail.location,
                ),
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.black,
            ));
          }
        });
  }
}

class ProfileDetailLine extends StatelessWidget {
  ProfileDetailLine({
    required this.Name1,
    required this.Name2,
    Key? key,
  }) : super(key: key);
  String Name1;
  String Name2;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Name1,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            )),
        Text(Name2,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            )),
      ],
    ));
  }
}
