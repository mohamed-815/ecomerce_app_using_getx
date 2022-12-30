import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orands_fish_booking/authcontroller.dart';
import 'package:orands_fish_booking/model/favmodel.dart';
import 'package:orands_fish_booking/model/model.dart';

addingTofav(ModelProduct productdetail) async {
  final favitem = FavModel(
    oldid: productdetail.id,
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
      .doc('favlist')
      .collection('favlist')
      .doc();
  favitem.id = addingtofirebase.id;
  final json = favitem.toJson();
  await addingtofirebase.set(json);
  // if (pa.imagelist != null) {
  //   pa.imagelist!.clear();
  // }
  // if (pa.imagePath != '') {
  //   pa.imagePath!.value = '';
  // }
}

deleteFromFav(id) async {
  return await FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .doc(email!)
      .collection('userdetails')
      .doc('favlist')
      .collection('favlist')
      .doc(id)
      .delete();
}
