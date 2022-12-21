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
        .collection(email!)
        .doc('userdetails')
        .collection('total')
        .doc('total');

    fireinstance.set({'total': total});
  }
}

Stream<double> showTotal() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection(email!)
      .doc('userdetails')
      .collection('total')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => double.parse(doc.data()['total'].toString()))
          .single);

  // .map((snapshot) =>
  //     snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
}
