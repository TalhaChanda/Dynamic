import 'dart:convert';
import 'package:dynamic_forms_v1/models/assign_forms_model.dart';
import 'package:dynamic_forms_v1/models/login_model.dart';
import 'package:dynamic_forms_v1/models/submit_forms_model.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  static Future<http.Response> postLogin(LoginModel loginModel) async {
    var response = await http.post(
      Uri.parse("http://demo.techxcape.com/dynamicform/public/api/auth/login"),
      body: jsonEncode(loginModel.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    return response;
  }

  static Future<AssignFormsModel> getAssignForms(int id) async {
    var response = await http.get(
      Uri.parse(
          "http://demo.techxcape.com/dynamicform/public/api/forms/?id=$id"),
    );
    if (response.statusCode == 200) {
      return assignFormsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

 static Future<http.Response> postSubmit(SubmitFormsModel submitFormsModel) async {
    var response = await http.post(
      Uri.parse(
          "http://demo.techxcape.com/dynamicform/public/api/forms/submit"),
      body: jsonEncode(submitFormsModel.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );

    return response;
  }
}
