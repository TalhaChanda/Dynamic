import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
   String? token;

  @override
  void onReady() {
    checkLogin().whenComplete(() async {
      Timer(
        const Duration(seconds: 3),
        () {
          Get.offAndToNamed(token == null
              ? "/Login"
              : "/Dashboard"
              );
        },
      );
    });
    super.onReady();
  }

    Future checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var tok = preferences.getString('token');
    token = tok;
  }
}
