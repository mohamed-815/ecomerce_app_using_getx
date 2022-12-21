import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/settings/profile.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/common_textform.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var Passwordcontroller = TextEditingController();
    var Passwordcontroller2 = TextEditingController();
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
                child: TextField1(
                  controller1: emailcontroller,
                  hint: 'Email',
                  lebel: ' email',
                  icon: Icons.email,
                ),
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
                child: TextField1(
                    controller1: Passwordcontroller,
                    hint: 'Enter Password',
                    lebel: 'Password'),
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
                    controller1: Passwordcontroller2,
                    hint: 'Reenter Password',
                    lebel: 'Reenter Password'),
              ),
              khieght,
              khieght,
              khieght,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Submit'))),
                onPressed: () {
                  if (Passwordcontroller2.text.trim() ==
                      Passwordcontroller.text.trim()) {
                    AuthController.instance.register(
                        emailcontroller.text.trim(),
                        Passwordcontroller.text.trim());
                  } else {
                    Get.snackbar('Login', 'message',
                        messageText: Text('Password is Not Matching'));
                  }
                  //   Get.to(HomeScreen());
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
