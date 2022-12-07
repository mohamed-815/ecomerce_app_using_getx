import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/widgets/heading.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Moor_color_change.jpg'),
                // child: Image.asset(
                //   'assets/Moor_color_change.jpg',
                //   fit: BoxFit.cover,
                // ),
              ),
              khieght,
              Textwidgrt(title1: 'Naveen'),
              Row(
                children: [
                  smalltextboldWidjets(Title: "User Name"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child:
                    TextField1(hint: 'yanchui@gmail.com', lebel: 'Email I’d'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Phone Number"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: '+14987889999', lebel: 'Phone Number'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "shop name"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'shop name', lebel: 'Enter shop name'),
              ),
              khieght,
              Row(
                children: [
                  smalltextboldWidjets(Title: "Location"),
                ],
              ),
              khieght,
              Container(
                height: shieght / 16,
                child: TextField1(hint: 'Location', lebel: 'Enter Location'),
              ),
              khieght,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: SizedBox(
                    width: swidth / 1.5, child: Center(child: Text('Sign In'))),
                onPressed: () {},
              )
            ],
          ),
        ),
      )),
    );
  }
}

class TextField1 extends StatelessWidget {
  TextField1({
    Key? key,
    this.controller1,
    this.icon,
    required this.hint,
    required this.lebel,
  }) : super(key: key);
  String lebel;
  String hint;
  IconData? icon;
  TextEditingController? controller1;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      //obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lebel,
          hintText: hint,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
