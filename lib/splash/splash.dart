import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({required this.image, super.key});

  String image;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      goToScreen(context);
    });

    return Scaffold(
      body: Container(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<dynamic> goToScreen(context) async {
  await Future.delayed(const Duration(seconds: 2));
}
