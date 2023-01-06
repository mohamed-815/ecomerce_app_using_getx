import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/controllers/authcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/common_textform.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/const/const.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var emailcontroller = TextEditingController();
  var Passwordcontroller = TextEditingController();
  var Passwordcontroller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 220, 220),
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
              Textwidgrtblack(title1: 'Register here'),
              khieght,
              khieght,
              Container(
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
                child: TextField1(
                    controller1: Passwordcontroller,
                    hint: 'Enter Password',
                    lebel: 'Password'),
              ),
              khieght,
              khieght,
              Container(
                child: TextField1(
                    controller1: Passwordcontroller2,
                    hint: 'Reenter Password',
                    lebel: 'Reenter Password'),
              ),
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
