import 'package:flutter/material.dart';
import 'package:orands_fish_booking/app_module/presentation/widgetscommon/heading.dart';

class OfferContainer extends StatelessWidget {
  OfferContainer({
    required this.image,
    required this.itemprice,
    required this.itemname,
    required this.title1,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;
  String title1;
  String itemprice;
  String itemname;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shieght / 6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7)),
                  height: shieght / 8,
                  width: swidth / 2.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     left: 6,
                //     child: Text(
                //       title1,
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                //     )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [smalltextboldWidjets(Title: itemname)],
          )
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    required this.image,
    required this.categoryname,
    Key? key,
    required this.shieght,
    required this.swidth,
  }) : super(key: key);

  final double shieght;
  final double swidth;

  String categoryname;
  String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: shieght / 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
              height: shieght / 9,
              width: swidth / 4,
            ),
          ),
          smalltextboldWidjets(Title: categoryname)
        ],
      ),
    );
  }
}
