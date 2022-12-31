import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({required this.image, super.key});

  String image;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //goToScreen(context);
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            height: double.infinity,
          ),
          Positioned(
            top: 300.h,
            left: 55.w,
            child: Column(
              children: [
                Text(
                  'Oranda Pets',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                khieght,
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<dynamic> goToScreen(context) async {
  await Future.delayed(const Duration(seconds: 5));
}
