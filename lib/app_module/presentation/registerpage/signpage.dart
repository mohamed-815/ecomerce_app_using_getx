import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/common_textform.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

import 'package:orands_fish_booking/app_module/presentation/registerpage/registerpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  AuthController ac = Get.find();
  var emailcontroller = TextEditingController();
  var Passwordcontroller = TextEditingController();
  var Passwordcontroller2 = TextEditingController();
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
              Textwidgrtblack(title1: 'Log here'),
              khieght,

              khieght,
              Container(
                //height: shieght / 16,
                child: TextField1(
                  controller1: emailcontroller,
                  hint: 'Email',
                  lebel: ' email',
                  icon: Icons.email,
                ),
              ),
              khieght,

              khieght,
              Container(
                //height: shieght / 16,
                child: TextField1(
                    controller1: Passwordcontroller,
                    hint: 'Enter Password',
                    lebel: 'Password'),
              ),

              khieght,

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Submit'))),
                onPressed: () {
                  AuthController.instance.login(emailcontroller.text.trim(),
                      Passwordcontroller.text.trim());
                  //Get.to(HomeScreen());
                },
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Tape Here',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      Get.to(() => RegisterPage());
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

              SignInButton(Buttons.Google, onPressed: () {
                ac.googlesign_methode();
              })
              //
            ],
          ),
        ),
      )),
    );
  }
}
