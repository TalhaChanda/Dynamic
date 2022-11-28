import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerBarController extends GetxController {
  String? userName;

  @override
  void onInit() {
    getUserName();
    super.onInit();
  }

  getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var name = preferences.getString("userName");
    userName = name;
    return userName;
  }

  removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    Get.offAndToNamed("/Login");
  }
}
