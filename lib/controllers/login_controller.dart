import 'dart:convert';
import 'package:dynamic_forms_v1/models/login_model.dart';
import 'package:dynamic_forms_v1/services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidate(value) {
    if (value.isEmpty) {
      return "Please enter Email";
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return 'Please a valid Email';
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      return "Please enter Password";
    }
    return null;
  }

  postLogin(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      isLoading(true);
      try {
        var request = LoginModel(
          email: emailController.text,
          password: passwordController.text,
        );

        await HttpServices.postLogin(request).then((res) async {
          if (res.statusCode == 200) {
            print(res.body);
            var data = jsonDecode(res.body);
            var token = data["token"];
            var userId = data["user"]["id"];
            var userName = data["user"]["name"];

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.setString('token', token);
            await preferences.setInt('userId', userId);
            await preferences.setString('userName', userName);

            Get.offAndToNamed("/Dashboard");
          } else {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: const Text("An Error Occured!"),
                      content: const Text("Incorrect Email or Password"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Okay'))
                      ],
                    ));
            print(res.body);
          }
        });
      } finally {
        isLoading(false);
      }
    }
  }
}
