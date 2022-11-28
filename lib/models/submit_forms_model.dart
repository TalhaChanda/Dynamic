import 'dart:convert';

SubmitFormsModel submitFormsModelFromJson(String str) =>
    SubmitFormsModel.fromJson(json.decode(str));

String submitFormsModelToJson(SubmitFormsModel data) =>
    json.encode(data.toJson());

class SubmitFormsModel {
  SubmitFormsModel({
    this.userId,
    this.formId,
    this.answer,
  });

  String? userId;
  String? formId;
  String? answer;

  factory SubmitFormsModel.fromJson(Map<String, dynamic> json) =>
      SubmitFormsModel(
        userId: json["user_id"],
        formId: json["form_id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "form_id": formId,
        "answer": answer,
      };
}
