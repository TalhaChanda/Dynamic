import 'package:dynamic_forms_v1/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
