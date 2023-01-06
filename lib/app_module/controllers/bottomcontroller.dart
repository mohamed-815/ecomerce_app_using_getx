import 'package:get/state_manager.dart';

class BottomNavController extends GetxController {
  RxInt curentintex = 0.obs;

  changePage(int index) {
    curentintex.value = index;
  }
}
