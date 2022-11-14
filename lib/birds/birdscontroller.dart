import 'package:get/state_manager.dart';
import 'package:orands_fish_booking/itemshowingwcreen/itemmodelclass.dart';

final images = [
  'assets/maxresdefault.jpg',
  'assets/AmericanGoldfinch_MattWilliams_4000x2200.jpg',
  'assets/download.jpeg'
];

class BirdController extends GetxController {
  int currentindex = 0;
  final birddetail = ItemDetail(
      title1: 'love Birds',
      title2: '1 Ps @ 10rs',
      title3: '100pc',
      images1: images);

  indexChange(index) {
    currentindex = index;
    update();
  }
}
