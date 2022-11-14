import 'package:get/state_manager.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';

final images = [
  'assets/ediblefishes/images.jpeg',
  'assets/ediblefishes/images.jpeg',
  'assets/ediblefishes/phangasius-fish-seeds-for-farming-546.jpg'
];

class EdibleController extends GetxController {
  final edibledetail = ItemDetail(
      title1: 'thilapia',
      title2: '1 Ps @ 2rs',
      title3: '100ps',
      images1: images);

  int currentindex = 0;
  indexChange(index) {
    currentindex = index;
    update();
  }
}
