import 'package:get/state_manager.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';

final images = [
  'assets/Moor_color_change.jpg',
  'assets/images (5).jpeg',
];

class AquariumController extends GetxController {
  int currentindex = 0;

  final edibledetail = ItemDetail(
      title1: 'Gold fish',
      title2: '1 Ps @ 5rs',
      title3: '100ps',
      images1: images);

  indexChange(index) {
    currentindex = index;
    update();
  }
}
