import 'package:dynamic_forms_v1/controllers/login_controller.dart';
import 'package:dynamic_forms_v1/widgets/button_widget.dart';
import 'package:dynamic_forms_v1/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Form(
              key: controller.globalKey,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .3,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(
                          size.height * .3,
                          size.height * .13,
                        ),
                        bottomRight: Radius.elliptical(
                          size.height * .3,
                          size.height * .13,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.height * .05,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          'Dynamic Forms',
                          style: TextStyle(
                            fontSize: size.height * .03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .045,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: size.height * .03,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                      width: size.width * .9,
                      child: TextFieldWidget(
                        controller: controller.emailController,
                        hintText: "Email",
                        validator: controller.emailValidate,
                      )),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                      width: size.width * .9,
                      child: TextFieldWidget(
                          controller: controller.passwordController,
                          validator: controller.passwordValidate,
                          obscureText: true,
                          hintText: "Password")),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Obx(() => controller.isLoading.value == true
                      ? CircularProgressIndicator()
                      : Text('')),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  Container(
                      width: size.width * .75,
                      height: size.height * .06,
                      child: ButtonWidget(
                        buttonText: "Login",
                        onPressed: () {
                          controller.postLogin(context);
                        },
                      )),
                  SizedBox(
                    height: size.height * .025,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
