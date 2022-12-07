import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orands_fish_booking/const/const.dart';
import 'package:orands_fish_booking/widgets/heading.dart';
import 'package:orands_fish_booking/widgetscommon/itemlistinglist.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: backbutton2(),
              ),
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              kwidth,
              Center(child: CartHeading1(title1: 'Order'))
            ],
          ),
          khieght,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white.withOpacity(.1),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Container(
                  width: 80,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://media.istockphoto.com/id/1368239780/photo/clown-fish.jpg?b=1&s=170667a&w=0&k=20&c=mBdC45x6navTxLRmA7_k7srPFGvbQmaBf6HINhwkE-Q=',
                          )),
                      borderRadius: BorderRadius.circular(6)),
                ),
                title: Text(
                  'gold fish',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  '100ps',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '100Rs',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.published_with_changes,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
