import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orands_fish_booking/app_module/presentation/home/homescreen.dart';
import 'package:orands_fish_booking/app_module/presentation/offer/widgets/offeepageview.dart';
import 'package:orands_fish_booking/app_module/presentation/offer/widgets/widget.dart';

class OfferPageView extends StatelessWidget {
  OfferPageView({super.key});
  PageController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: showTheoriginalOfferList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Center(child: Text('Some Thing Went Wrong'));
            }
            if (snapshot.hasData) {
              final list = snapshot.data;
              return PageView(
                scrollDirection: Axis.vertical,
                //  controller: controller,
                children: list!
                    .map((e) => OfferItemshowwidget(
                          item: e,
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator(
                color: Colors.black,
              );
            }
          }),
    );
  }
}
