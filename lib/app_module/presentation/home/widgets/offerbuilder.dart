import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/home/homescreen.dart';
import 'package:orands_fish_booking/app_module/presentation/home/widgets/containerhome.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';

import 'package:orands_fish_booking/app_module/presentation/itemshowingwcreen/itemshowingscreen.dart';

class OfferBiulder extends StatelessWidget {
  OfferBiulder({
    this.itemname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;
  String? itemname;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: showTheoriginalOfferList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: CartHeading(title1: 'Something wrong'));
          }
          if (snapshot.hasData) {
            final list = snapshot.data!;
            final offerlist = itemname != null
                ? list.where((element) => element.category == itemname).toList()
                : list;

            return offerlist.length != 0
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: offerlist.length,
                    itemBuilder: (context, index) {
                      final offeritem = offerlist[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ItemShowingScreen(itemdetail: offeritem));
                        },
                        child: OfferContainer(
                          image: offeritem.imagelist?[0] == null
                              ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmtF4VdOl8_m-1FayEemKpgZvDuvgHOqAhFQ&usqp=CAU'
                              : offeritem.imagelist?[0],
                          itemname: offeritem.name,
                          itemprice: '${offeritem.price}rs',
                          shieght: shieght,
                          swidth: swidth,
                          title1: 'min ${offeritem.minno}ps',
                        ),
                      );
                    })
                : Center(child: Textwidgrt(title1: 'No Offers'));
          } else {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
        });
  }
}
