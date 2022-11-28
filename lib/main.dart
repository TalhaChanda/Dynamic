import 'package:dynamic_forms_v1/bindings/assign_forms_controller_binding.dart';
import 'package:dynamic_forms_v1/bindings/dashboard_controller_binding.dart';
import 'package:dynamic_forms_v1/bindings/login_controller_binding.dart';
import 'package:dynamic_forms_v1/bindings/splash_controller_binding.dart';
import 'package:dynamic_forms_v1/views/assign_forms_details_view.dart';
import 'package:dynamic_forms_v1/views/dashboard_view.dart';
import 'package:dynamic_forms_v1/views/login_view.dart';
import 'package:dynamic_forms_v1/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Forms',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      getPages: [
        GetPage(
            name: "/",
            page: () => SplashView(),
            binding: SplashControllerBinding()),
        GetPage(
            name: "/Login",
            page: () => LoginView(),
            binding: LoginControllerBinding()),
             GetPage(
            name: "/Dashboard",
            page: () => DashboardView(),
            binding: DashboardControllerBinding(),
        ),
         GetPage(
            name: "/AssignFormsDetails",
            page: () => AssignFormsDetailsView(),
        ),
         
      ],
    );
  }
}
