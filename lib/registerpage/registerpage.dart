import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              khieght,
              Textwidgrt(title1: 'Register here'),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "User Name"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'Enter UserName', lebel: ' Username'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Password"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'Enter Password', lebel: 'Password'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Reenter Password"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(
                    hint: 'Reenter Password', lebel: 'Reenter Password'),
              ),
              khieght,
              khieght,
              khieght,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Submit'))),
                onPressed: () {
                  Get.to(HomeScreen());
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
