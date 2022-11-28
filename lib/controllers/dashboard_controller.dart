import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs;

  changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
