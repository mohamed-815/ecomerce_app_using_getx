import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/model/model.dart';

class CartModel {
  // String image;
  String id;
  String category;
  String name;
  String size;
  double price;
  double minno;
  double minnomultiple;
  String description;
  double subtotalprice;
  List<dynamic>? imagelist = [];

  CartModel({
    required this.minnomultiple,
    required this.subtotalprice,
    this.imagelist,
    // required this.imagelist,
    this.id = '',
    required this.description,
    //  required this.image,
    required this.name,
    required this.category,
    required this.minno,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'minnomultiple': minnomultiple,
      'subtotalprice': subtotalprice,
      'id': id,
      'category': category,
      'name': name,
      'size': size,
      'price': price,
      'minno': minno,
      'description': description,
      'imagelist': imagelist,
    };
  }

  static CartModel fromJson(Map<String, dynamic> json) {
    return CartModel(
      minnomultiple: json['minnomultiple'],
      subtotalprice: json['subtotalprice'],
      id: json['id'],
      description: json['description'],
      name: json['name'],
      category: json['category'],
      minno: json['minno'],
      price: json['price'],
      size: json['size'],
      imagelist: json['imagelist'],
    );
  }
}

//CartModel? cartmodel;
addingToCart(ModelProduct productdetail) async {
  final cartmodel = CartModel(
    minnomultiple: productdetail.minno,
    subtotalprice: productdetail.minno * productdetail.price,
    description: productdetail.description,
    name: productdetail.name,
    category: productdetail.category,
    minno: productdetail.minno,
    price: productdetail.price,
    size: productdetail.size,
    imagelist: productdetail.imagelist,
  );

  final addingtofirebase = FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('cartlist')
      .collection('cartlist')
      .doc();
  cartmodel.id = addingtofirebase.id;
  final json = cartmodel.toJson();
  await addingtofirebase.set(json);
  // if (pa.imagelist != null) {
  //   pa.imagelist!.clear();
  // }
  // if (pa.imagePath != '') {
  //   pa.imagePath!.value = '';
  // }
}
