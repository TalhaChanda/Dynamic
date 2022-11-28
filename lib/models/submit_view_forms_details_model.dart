import 'dart:convert';

SubmitViewFormsDetailsModel submitViewFormsDetailsModelFromJson(String str) => SubmitViewFormsDetailsModel.fromJson(json.decode(str));

String submitViewFormsDetailsModelToJson(SubmitViewFormsDetailsModel data) => json.encode(data.toJson());

class SubmitViewFormsDetailsModel {
    SubmitViewFormsDetailsModel({
        this.forms,
        this.answers,
    });

    List<Form>? forms;
    List<Answer>? answers;

    factory SubmitViewFormsDetailsModel.fromJson(Map<String, dynamic> json) => SubmitViewFormsDetailsModel(
        forms: List<Form>.from(json["forms"].map((x) => Form.fromJson(x))),
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forms": List<dynamic>.from(forms!.map((x) => x.toJson())),
        "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
    };
}

class Answer {
    Answer({
        this.id,
        this.answer,
        this.questionId,
        this.formId,
        this.userId,
        this.formInstance,
        this.createdAt,
        this.updatedAt,
        this.userName,
    });

    int? id;
    String? answer;
    String? questionId;
    String? formId;
    int? userId;
    String? formInstance;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userName;

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answer: json["answer"],
        questionId: json["question_id"],
        formId: json["form_id"],
        userId: json["user_id"],
        formInstance: json["form_instance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "question_id": questionId,
        "form_id": formId,
        "user_id": userId,
        "form_instance": formInstance,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user_name": userName,
    };
}

class Form {
    Form({
        this.id,
        this.title,
        this.description,
        this.assignedUsers,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? description;
    String? assignedUsers;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Form.fromJson(Map<String, dynamic> json) => Form(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        assignedUsers: json["assigned_users"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "assigned_users": assignedUsers,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
