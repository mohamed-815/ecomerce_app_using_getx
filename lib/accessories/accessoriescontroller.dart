import 'package:get/state_manager.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';

final images = [
  'assets/accessories/400x400.jpeg',
  'assets/accessories/aquarium-air-stone-250x250.jpg',
  'assets/accessories/aquarium-air-stone-500x500.jpg'
];

class AccessoriesController extends GetxController {
  int currentindex = 0;
  final edibledetail = ItemDetail(
      title1: 'Filter ball',
      title2: '1 Ps @ 5rs',
      title3: '100ps',
      images1: images);
  indexChange(index) {
    currentindex = index;
    update();
  }
}
