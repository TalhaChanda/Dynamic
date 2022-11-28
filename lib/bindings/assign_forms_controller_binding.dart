import 'package:dynamic_forms_v1/controllers/assign_forms_controller.dart';
import 'package:get/get.dart';

class AssignFormsControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignFormsController>(() => AssignFormsController());
  }
}
