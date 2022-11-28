import 'dart:convert';

SubmitViewFormsModel submitViewFormsModelFromJson(String str) => SubmitViewFormsModel.fromJson(json.decode(str));

String submitViewFormsModelToJson(SubmitViewFormsModel data) => json.encode(data.toJson());

class SubmitViewFormsModel {
    SubmitViewFormsModel({
        this.forms,
        this.formInstances,
    });

    Forms? forms;
    Map<String, List<FormInstance>>? formInstances;

    factory SubmitViewFormsModel.fromJson(Map<String, dynamic> json) => SubmitViewFormsModel(
        forms: Forms.fromJson(json["forms"]),
        formInstances: Map.from(json["form_instances"]).map((k, v) => MapEntry<String, List<FormInstance>>(k, List<FormInstance>.from(v.map((x) => FormInstance.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "forms": forms!.toJson(),
        "form_instances": Map.from(formInstances!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class FormInstance {
    FormInstance({
        this.id,
        this.answer,
        this.questionId,
        this.formId,
        this.userId,
        this.formInstance,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? answer;
    String? questionId;
    String? formId;
    String? userId;
    String? formInstance;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory FormInstance.fromJson(Map<String, dynamic> json) => FormInstance(
        id: json["id"],
        answer: json["answer"],
        questionId: json["question_id"],
        formId: json["form_id"],
        userId: json["user_id"],
        formInstance: json["form_instance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
    };
}

class Forms {
    Forms({
        this.id,
        this.title,
        this.description,
        this.assignedUsers,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    int? id;
    String? title;
    String? description;
    String? assignedUsers;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic user;

    factory Forms.fromJson(Map<String, dynamic> json) => Forms(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        assignedUsers: json["assigned_users"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "assigned_users": assignedUsers,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user": user,
    };
}
