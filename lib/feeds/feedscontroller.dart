import 'package:get/state_manager.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';

final images = [
  'assets/feeds/download.jpeg',
  'assets/feeds/images.jpeg',
  'assets/feeds/Tetra-Tetramin-Large-Flakes.jpg'
];

class FeedController extends GetxController {
  int currentindex = 0;
  final edibledetail = ItemDetail(
      title1: 'Flack feed',
      title2: '1 Ps @ 100rs',
      title3: '50ps',
      images1: images);

  indexChange(index) {
    currentindex = index;
    update();
  }
}
