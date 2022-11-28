import 'package:dynamic_forms_v1/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
