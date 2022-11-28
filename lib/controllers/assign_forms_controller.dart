import 'package:dynamic_forms_v1/models/assign_forms_model.dart';
import 'package:dynamic_forms_v1/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignFormsController extends GetxController {
  var isLoading = true.obs;
  final globalKey = GlobalKey<FormState>();
  AssignFormsModel? assignForms;
  List<TextEditingController> textControllerList = [];
  List<TextEditingController> emailControllerList = [];
  List<TextEditingController> numberControllerList = [];
  List<TextEditingController> dateControllerList = [];
  final changeState = false.obs;
  final changeStateDrop = false.obs;
  final changeStateCheck = false.obs;
  final changeStatetext = false.obs;
  final changeStateemail = false.obs;
  final changeStatenumber = false.obs;
  final changeStatedate = false.obs;


  List<Map<String, String>> textList = [];
  List<Map<String, String>> emailList = [];
  List<Map<String, String>> numberList = [];
  List<Map<String, String>> dateList = [];
  List<Map<String, String>> radioList = [];
  List<Map<String, String>> checkList = [];
  List<Map<String, String>> dropList = [];

  @override
  void onInit() {
    textControllerList;
    emailControllerList;
    numberControllerList;
    dateControllerList;
    getUserId();
    getAssignForms();
    super.onInit();
  }
  

  getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getInt("userId");
    return id;
  }

  getAssignForms() async {
    try {
      isLoading(true);
      var id = await getUserId();

      final forms = await HttpServices.getAssignForms(id);
      if (forms != null) {
        assignForms = forms;
      }
    } finally {
      isLoading(false);
    }
  }

  findById(int id) {
    return assignForms!.forms!.firstWhere(
      (form) => form.formId == id,
    );
  }
}
