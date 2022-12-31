import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:orands_fish_booking/accessories/Accessories.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/home/gifclass.dart';
import 'package:orands_fish_booking/home/homoclasses/categoryclass.dart';

import 'package:orands_fish_booking/home/widgets/ContainerHome.dart';
import 'package:orands_fish_booking/home/widgets/gifwidget.dart';
import 'package:orands_fish_booking/home/widgets/offerbuilder.dart';
import 'package:orands_fish_booking/home/widgets/offername.dart';
import 'package:orands_fish_booking/home/widgets/scafold_back.dart';
import 'package:orands_fish_booking/home/widgets/showdialogshow.dart';

import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/search.dart';
import 'package:orands_fish_booking/settings/settings.dart';

Stream<List<ModelProduct>> showTheoriginalOfferList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('offerlist')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  PageController? controller2;
  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Swidth(context);
      Shieght(context);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          ScafoldBackGroundImage(
            image:
                "https://w0.peakpx.com/wallpaper/765/104/HD-wallpaper-fish-red-exotic-vara-peste-summer-black-blue-beta.jpg",
          ),
          const ScafoldBackGroundColor(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: const Color.fromARGB(115, 24, 22, 22),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder: (BuildContext buildContext,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return ShowDialogeshow(
                                data:
                                    'https://icon-library.com/images/gif-icon/gif-icon-2.jpg',
                                item: const Settings1(),
                              );
                            });
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Color.fromARGB(255, 180, 174, 174),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        // Get.to(() => Search());
                        await showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: const Color.fromARGB(115, 24, 22, 22),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder: (BuildContext buildContext,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return ShowDialogeshow(
                                data:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbGrm3C3QgWyL0mk3GbQ6JC36t_w1G9VzAww&usqp=CAU',
                                item: Search(),
                              );
                            });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.5),
                        child: const Center(
                            child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 36, 35, 35),
                          size: 18,
                        )),
                      ),
                    ),
                  ),
                  khieght,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        OfferName(
                          name: 'Offers in Aquarium',
                          cartcircle:
                              const CartCircle(icon: Icons.shopping_cart),
                        ),
                        SizedBox(
                          height: shieght / 5.5,
                          child: OfferBiulder(
                            shieght: shieght,
                            swidth: swidth,
                            itemname: 'aquarium',
                          ),
                        ),
                        OfferName(name: 'Offer in birds'),
                        SizedBox(
                          height: Shieght(context) / 5.5,
                          child: OfferBiulder(
                            shieght: shieght,
                            swidth: swidth,
                            itemname: 'birds',
                          ),
                        ),
                        OfferName(name: 'All Offers'),
                        SizedBox(
                            height: shieght / 5.5,
                            child: OfferBiulder(
                              shieght: shieght,
                              swidth: swidth,
                            )),
                        OfferName(name: 'Items'),
                        khieght,
                        SizedBox(
                          height: shieght / 1.55,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 35.0,
                            mainAxisSpacing: 3,
                            children: List.generate(5, (index) {
                              final tocategory = categorylist[index];

                              return GestureDetector(
                                onTap: () => Get.to(() => Accessories(
                                      category: tocategory.categoryname,
                                      titlelarge: tocategory.categoryheading,
                                    )),
                                child: CategoryContainer(
                                    image: tocategory.image,
                                    categoryname: tocategory.categoryheading,
                                    shieght: shieght,
                                    swidth: swidth),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 250.h,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: PageView(
                              controller: controller2,
                              children: gifitemlist
                                  .map((e) =>
                                      GifWidget(data: e.data, image: e.image))
                                  .toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
