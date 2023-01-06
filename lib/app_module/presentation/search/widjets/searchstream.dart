import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/app_module/presentation/itemshowingwcreen/itemshowingscreen.dart';
import 'package:orands_fish_booking/app_module/presentation/search/search.dart';
import 'package:orands_fish_booking/app_module/controllers/searchcontroller.dart';
import 'package:orands_fish_booking/app_module/presentation/search/widjets/notfoundmsg.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/steggereditem.dart';

class SearchStream extends StatelessWidget {
  const SearchStream({
    required this.c,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;
  final SearchController c;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: showTheListSearch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'some Thing went wrong',
              style: TextStyle(fontSize: 20),
            ));
          }

          if (snapshot.hasData) {
            c.searchlist = snapshot.data!;

            return c.controller.value.text.isNotEmpty
                ? c.finalsearchlist.isNotEmpty
                    ? StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children:
                            List.generate(c.finalsearchlist.length, (index) {
                          final item = c.finalsearchlist[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(ItemShowingScreen(itemdetail: item));
                            },
                            child: StaggeredItem(
                              isfromtotal: 'no',
                              item: item,
                              shieght: shieght,
                              swidth: swidth,
                              index: index,
                            ),
                          );
                        }),
                      )
                    : Center(
                        child: SearchHelper(
                            image:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl4IYYHeqyg9qOjvXaW5y5c8f9Uqwd1JxMzw&usqp=CAU',
                            title: 'ooOps'))
                : Center(
                    child: SearchHelper(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ1Kofkn0SvQ1x3e3mUBE6L5kS8SlWrhuX-197MeIqp5OqoaqNhSgjmkpClqMbAvsy6_o&usqp=CAU',
                        title: 'Search It'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
