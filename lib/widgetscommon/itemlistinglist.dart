import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:orands_fish_booking/cart/placeordercontroller.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/model/model.dart';
import 'package:orands_fish_booking/search/search.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/TypeItem.dart';
import 'package:orands_fish_booking/widgetscommon/steggereditem.dart';

class ListingItemPage1 extends StatelessWidget {
  ListingItemPage1({
    required this.titlelarge,
    this.itemdtail,
    Key? key,
  }) : super(key: key);
  Stream<List<ModelProduct>>? itemdtail;
  String titlelarge;

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(
      children: [
        Image.network(
          "https://i.pinimg.com/736x/cb/be/58/cbbe5877d54aee677cf2e027ca2ccd27.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(.3),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backbutton1(),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
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
                    children: [
                      ItemListHeading(title1: titlelarge),
                    ],
                  ),
                  Row(
                    children: [
                      StreamBuilder(
                          stream: itemdtail,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error Found');
                            }
                            if (snapshot.hasData) {
                              final list = snapshot.data!;
                              return Text(
                                '${list.length} Prodects found',
                                style: TextStyle(color: Colors.white),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: itemdtail,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('some thing went wrong');
                  }

                  if (snapshot.hasData) {
                    final showingitems = snapshot.data!;
                    return showingitems.isNotEmpty
                        ? Expanded(
                            child: StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children:
                                  List.generate(showingitems.length, (index) {
                                final item = showingitems[index];

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ItemShowingScreen(itemdetail: item));
                                  },
                                  child: StaggeredItem(
                                    isfromtotal: 'yes',
                                    item: item,
                                    shieght: shieght,
                                    swidth: swidth,
                                    index: index,
                                  ),
                                );
                              }),
                            ),
                          )
                        : Expanded(
                            child: Center(
                                child: CartHeading(
                            title1: 'Nothing Found',
                          )));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ],
    ));
  }
}

class backbutton1 extends StatelessWidget {
  const backbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        placeordercontroller.basevaleu.value = 1;
        print(placeordercontroller.basevaleu.value.toString());
        Get.back();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.5),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}

class backbutton2 extends StatelessWidget {
  const backbutton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.1),
        child: Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 208, 205, 205),
        ),
      ),
    );
  }
}
