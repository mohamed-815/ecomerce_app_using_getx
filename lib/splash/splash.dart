import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/registerpage/registerpage.dart';
import 'package:orands_fish_booking/registerpage/signpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      goToScreen(context);
    });
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
        child: Image.asset(
          'assets/Rectangle 2241.png',
          height: 120,
          width: 120,
          fit: BoxFit.fill,
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<dynamic> goToScreen(context) async {
  await Future.delayed(const Duration(seconds: 2));

  Get.offAll(() => LoginPage());
}
