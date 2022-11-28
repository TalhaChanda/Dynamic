import 'package:dynamic_forms_v1/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
