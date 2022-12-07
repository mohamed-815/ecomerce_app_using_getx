import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:orands_fish_booking/authcontroller.dart';

class CartController extends GetxController {
  double total = 0.0;

  valeusetingzero() {
    total = 0;
  }

  valeuseting(double subtotal) {
    total = total + subtotal;

    final fireinstance = FirebaseFirestore.instance
        .collection('collection')
        .doc('users')
        .collection('total')
        .doc('total1');

    fireinstance.set({'total': total.toString()});
  }
}

Stream<String> showTotal() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('total')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => doc.data()['total'].toString())
          .toString());

  // .map((snapshot) =>
  //     snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
}
