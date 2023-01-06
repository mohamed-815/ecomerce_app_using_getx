import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/classes/profile_model/profilemodel.dart';
import 'package:orands_fish_booking/app_module/presentation/settings/profileshow.dart';
import 'package:orands_fish_booking/app_module/presentation/settings/widgets/settingscard.dart';

Row AddingProfileDetail(ProfileDetail? profiledetail) {
  return Row(
    children: [
      kwidth,
      kwidth,
      kwidth,
      kwidth,
      GestureDetector(
        onTap: () => Get.defaultDialog(
            title: '', content: const ProfileShow(), radius: 10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profiledetail?.photo == null
              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAc4GCQZot5eKOyV67mJsNGNJnZedJJUPpmQ&usqp=CAU"
              : profiledetail!.photo!),
          // child: Image.asset(
          //   'assets/Moor_color_change.jpg',
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
      kwidth,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profiledetail?.name == null
                ? 'Name'
                : profiledetail!.name.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          SizedBox(
              width: 170.w,
              child: Text(
                email!,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    ],
  );
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        kwidth,
        GreyText(title: 'Account Settings'),
        kwidth,
      ],
    );
  }
}
