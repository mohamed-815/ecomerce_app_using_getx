import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/listitem.dart';

import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/app_module/presentation/favorite/widgets/smallcircles.dart';
import 'package:orands_fish_booking/app_module/presentation/home/widgets/scafold_back.dart';

import 'package:orands_fish_booking/app_module/presentation/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/app_module/classes/fav_model/favmodel.dart';
import 'package:orands_fish_booking/app_module/classes/product_model/model.dart';
import 'package:orands_fish_booking/app_module/presentation/search/widjets/notfoundmsg.dart';

class Favorite extends StatelessWidget {
  Favorite({
    this.formapage,
    required this.titlelarge,
    required this.favoritedetail,
    Key? key,
  }) : super(key: key);
  Stream<List<FavModel>> favoritedetail;
  String titlelarge;
  String? formapage;
  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff1b4332),
      body: Stack(
        children: [
          ScafoldBackGroundImage(
              image:
                  "https://play-lh.googleusercontent.com/HNjNLjByCQex3ul2RWGI9JjM2JlhCTjV-CKUUBue_J418L2YpYwfhsgkt1fSctzgA-4"),
          const ScafoldBackGroundColor(),
          SafeArea(
              child: Container(
            child: Column(
              children: [
                khieght,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      ItemListHeadingnewfont(title1: 'Favorites'),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: const Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 243, 4, 4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Circleavdarnew(
                                color: const Color.fromARGB(255, 40, 97, 73),
                              ),
                              Circleavdarnew(
                                  color: const Color.fromARGB(255, 40, 97, 73)),
                              Circleavdarnew(
                                color: const Color.fromARGB(255, 40, 97, 73),
                              ),
                            ],
                          ),
                          StreamBuilder(
                              stream: favoritedetail,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Error Found');
                                }
                                if (snapshot.hasData) {
                                  final list = snapshot.data!;
                                  return Textwidgrt1(
                                      title1: '${list.length} Items');
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                    stream: favoritedetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('some thing went wrong');
                      }

                      if (snapshot.hasData) {
                        final showingitems = snapshot.data!;
                        return showingitems.isNotEmpty
                            ? Expanded(
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 4.5.h,
                                  children: List.generate(showingitems.length,
                                      (index) {
                                    final item = showingitems[index];

                                    return GestureDetector(
                                      onTap: () {
                                        final ModelProduct cartadditem =
                                            ModelProduct(
                                                id: item.id,
                                                isfave: item.isfave,
                                                imagelist: item.imagelist,
                                                description: item.description,
                                                name: item.name,
                                                category: item.category,
                                                minno: item.minno,
                                                price: item.price,
                                                size: item.size);
                                        Get.to(ItemShowingScreen(
                                            itemdetail: cartadditem));
                                      },
                                      child: SimpleItem(
                                          itemdetail: item,
                                          title1: item.price.toString(),
                                          title2: item.minno.toString(),
                                          image: item.imagelist![0],
                                          itemname: item.name,
                                          shieght: shieght,
                                          swidth: swidth),
                                    );
                                  }),
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    khieght,
                                    khieght,
                                    khieght,
                                    khieght,
                                    Center(
                                        child: SearchHelper(
                                            image:
                                                'https://giffiles.alphacoders.com/202/20213.gif',
                                            title: 'Please Add Some.')),
                                  ],
                                ),
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
