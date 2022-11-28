import 'dart:convert';

AssignFormsModel assignFormsModelFromJson(String str) =>
    AssignFormsModel.fromJson(json.decode(str));

String assignFormsModelToJson(AssignFormsModel data) =>
    json.encode(data.toJson());

class AssignFormsModel {
  AssignFormsModel({
    this.forms,
    this.clinets,
  });

  List<Forms>? forms;
  List<Clinet>? clinets;

  factory AssignFormsModel.fromJson(Map<String, dynamic> json) =>
      AssignFormsModel(
        forms: List<Forms>.from(json["Forms"].map((x) => Forms.fromJson(x))),
        clinets:
            List<Clinet>.from(json["Clinets"].map((x) => Clinet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Forms": List<dynamic>.from(forms!.map((x) => x.toJson())),
        "Clinets": List<dynamic>.from(clinets!.map((x) => x.toJson())),
      };
}

class Clinet {
  Clinet({
    this.id,
    this.accNumber,
    this.customerName,
    this.address,
    this.description,
    this.contactPerson,
    this.contactNumber,
    this.cce,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? accNumber;
  String? customerName;
  String? address;
  String? description;
  String? contactPerson;
  String? contactNumber;
  String? cce;
  DateTime? createdAt;
  DateTime? updatedAt;
  


  factory Clinet.fromJson(Map<String, dynamic> json) => Clinet(
        id: json["id"],
        accNumber: json["acc_number"],
        customerName: json["customer_name"],
        address: json["address"],
        description: json["description"],
        contactPerson: json["contact_person"],
        contactNumber: json["contact_number"],
        cce: json["cce"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "acc_number": accNumber,
        "customer_name": customerName,
        "address": address,
        "description": description,
        "contact_person": contactPerson,
        "contact_number": contactNumber,
        "cce": cce,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Forms {
  Forms({
    this.formId,
    this.formTitle,
    this.formDescription,
    this.assignedUsers,
    this.questions,
  });

  int? formId;
  String? formTitle;
  String? formDescription;
  List<AssignedUser>? assignedUsers;
  List<Question>? questions;

  factory Forms.fromJson(Map<String, dynamic> json) => Forms(
        formId: json["form_id"],
        formTitle: json["form_title"],
        formDescription: json["form_description"],
        assignedUsers: List<AssignedUser>.from(
            json["assigned_users"].map((x) => AssignedUser.fromJson(x))),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "form_id": formId,
        "form_title": formTitle,
        "form_description": formDescription,
        "assigned_users":
            List<dynamic>.from(assignedUsers!.map((x) => x.toJson())),
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class AssignedUser {
  AssignedUser({
    this.userId,
  });

  String? userId;

  factory AssignedUser.fromJson(Map<String, dynamic> json) => AssignedUser(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}

class Question {
  Question(
      {this.id,
      this.formId,
      this.question,
      this.type,
      this.radioValues,
      this.checkboxValues,
      this.dropdownValues,
      this.selectedDropdownVal});

  int? id;
  String? formId;
  String? question;
  String? type;
  String? selectedDropdownVal;
  List<RadioValue>? radioValues;
  List<CheckboxValue>? checkboxValues;
  List<DropdownValue>? dropdownValues;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        formId: json["form_id"],
        question: json["question"],
        type: json["type"],
        selectedDropdownVal: json['type'] == 'dropdown'
            ? json["dropdown_values"][0]['title']
            : null,
        radioValues: json["radio_values"] == null
            ? null
            : List<RadioValue>.from(
                json["radio_values"].map((x) => RadioValue.fromJson(x))),
        checkboxValues: json["checkbox_values"] == null
            ? null
            : List<CheckboxValue>.from(
                json["checkbox_values"].map((x) => CheckboxValue.fromJson(x))),
        dropdownValues: json["dropdown_values"] == null
            ? null
            : List<DropdownValue>.from(
                json["dropdown_values"].map((x) => DropdownValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "form_id": formId,
        "question": question,
        "type": type,
        "radio_values": radioValues == null
            ? null
            : List<dynamic>.from(radioValues!.map((x) => x.toJson())),
        "checkbox_values": checkboxValues == null
            ? null
            : List<dynamic>.from(checkboxValues!.map((x) => x.toJson())),
        "dropdown_values": dropdownValues == null
            ? null
            : List<dynamic>.from(dropdownValues!.map((x) => x.toJson())),
      };
}

class CheckboxValue {
  CheckboxValue({
    this.title,
    this.value,
  });

  String? title;
  bool? value;

  factory CheckboxValue.fromJson(Map<String, dynamic> json) => CheckboxValue(
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
      };
}

class DropdownValue {
  DropdownValue({
    this.index,
    this.title,
    this.value,
  });

  int? index;
  String? title;
  int? value;

  factory DropdownValue.fromJson(Map<String, dynamic> json) => DropdownValue(
        index: json["index"],
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "value": value,
      };
}

class RadioValue {
  RadioValue({
    this.index,
    this.title,
    this.value,
  });

  int? index;
  String? title;
  int? value;

  factory RadioValue.fromJson(Map<String, dynamic> json) => RadioValue(
        index: json["index"],
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "value": value,
      };
}
