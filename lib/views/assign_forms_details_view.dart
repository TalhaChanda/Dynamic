import 'dart:convert';

import 'package:dynamic_forms_v1/controllers/assign_forms_controller.dart';
import 'package:dynamic_forms_v1/models/submit_forms_model.dart';
import 'package:dynamic_forms_v1/services/http_services.dart';
import 'package:dynamic_forms_v1/widgets/button_widget.dart';
import 'package:dynamic_forms_v1/widgets/checkbox_widget.dart';
import 'package:dynamic_forms_v1/widgets/radio_widget.dart';
import 'package:dynamic_forms_v1/widgets/text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AssignFormsDetailsView extends StatefulWidget {
  const AssignFormsDetailsView({super.key});

  @override
  State<AssignFormsDetailsView> createState() => _AssignFormsDetailsViewState();
}

class _AssignFormsDetailsViewState extends State<AssignFormsDetailsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formId = ModalRoute.of(context)!.settings.arguments as int;
    final controller = Get.put(AssignFormsController());
    final assignForms = Get.find<AssignFormsController>().findById(formId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          assignForms.formTitle,
          style: TextStyle(color: Colors.white, fontSize: size.height * .025),
        ),
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: controller.globalKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  width: size.width * .9,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: assignForms.questions.length,
                      itemBuilder: (context, index) {
                        controller.textControllerList
                            .add(TextEditingController());
                        controller.emailControllerList
                            .add(TextEditingController());
                        controller.numberControllerList
                            .add(TextEditingController());
                        controller.dateControllerList
                            .add(TextEditingController());

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          elevation: 8,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Container(
                                width: size.width * .75,
                                child: Text(
                                  assignForms.questions[index].question,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * .023,
                                  ),
                                ),
                              ),
                              if (assignForms.questions[index].type ==
                                  "textbox")
                                Column(
                                  children: [
                                    Container(
                                        width: size.width * .8,
                                        child: Obx(() => TextFieldWidget(
                                              keyboardType: TextInputType.text,
                                              hintText: "Enter this field",
                                              controller: controller
                                                      .changeStatetext.value
                                                  ? controller
                                                      .textControllerList[index]
                                                  : controller
                                                          .textControllerList[
                                                      index],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                controller
                                                    .textControllerList[index]
                                                    .text = value.toString();
                                                controller.textList.add({
                                                  "id": assignForms
                                                      .questions[index].id
                                                      .toString(),
                                                  "answer": controller
                                                      .textControllerList[index]
                                                      .text,
                                                });
                                                controller
                                                        .changeStatetext.value =
                                                    !controller
                                                        .changeStatetext.value;
                                              },
                                            ))),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                  ],
                                ),
                              if (assignForms.questions[index].type == "email")
                                Column(
                                  children: [
                                    Container(
                                        width: size.width * .8,
                                        child: Obx(() => TextFieldWidget(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              hintText: "Enter this field",
                                              controller: controller
                                                      .changeStateemail.value
                                                  ? controller
                                                          .emailControllerList[
                                                      index]
                                                  : controller
                                                          .emailControllerList[
                                                      index],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter Email";
                                                } else if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]",
                                                ).hasMatch(value)) {
                                                  return 'Please a valid Email';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                controller
                                                    .emailControllerList[index]
                                                    .text = value.toString();
                                                controller.emailList.add({
                                                  "id": assignForms
                                                      .questions[index].id
                                                      .toString(),
                                                  "answer": controller
                                                      .emailControllerList[
                                                          index]
                                                      .text,
                                                });
                                                controller.changeStateemail
                                                        .value =
                                                    !controller
                                                        .changeStateemail.value;
                                              },
                                            ))),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                  ],
                                ),
                              if (assignForms.questions[index].type == "number")
                                Column(
                                  children: [
                                    Container(
                                        width: size.width * .8,
                                        child: Obx(() => TextFieldWidget(
                                              hintText: "Enter this field",
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: controller
                                                      .changeStatenumber.value
                                                  ? controller
                                                          .numberControllerList[
                                                      index]
                                                  : controller
                                                          .numberControllerList[
                                                      index],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                controller
                                                    .numberControllerList[index]
                                                    .text = value.toString();
                                                controller.numberList.add({
                                                  "id": assignForms
                                                      .questions[index].id
                                                      .toString(),
                                                  "answer": controller
                                                      .numberControllerList[
                                                          index]
                                                      .text,
                                                });
                                                controller.changeStatenumber
                                                        .value =
                                                    !controller
                                                        .changeStatenumber
                                                        .value;
                                              },
                                            ))),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                  ],
                                ),
                              if (assignForms.questions[index].type ==
                                  "datetime-local")
                                Column(
                                  children: [
                                    Container(
                                        width: size.width * .8,
                                        child:
                                            GetBuilder<AssignFormsController>(
                                          builder: (con) => TextFieldWidget(
                                            readOnly: true,
                                            hintText: "Select Date",
                                            controller:
                                                con.dateControllerList[index],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "This field is required";
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              con.dateControllerList[index]
                                                  .text = value.toString();
                                              controller.dateList.add({
                                                "id": assignForms
                                                    .questions[index].id
                                                    .toString(),
                                                "answer": con
                                                    .dateControllerList[index]
                                                    .text
                                              });
                                            },
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2101),
                                                builder: (context, child) =>
                                                    Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary: Colors.orange,
                                                      onPrimary: Colors.black,
                                                      onSurface: Colors.black,
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors.orange,
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                ),
                                              );
                                              if (pickedDate != null) {
                                                print(pickedDate);
                                                String formattedDate =
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(
                                                  pickedDate,
                                                );
                                                print(formattedDate);
                                                controller
                                                    .dateControllerList[index]
                                                    .text = formattedDate;
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          ),
                                        )),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                  ],
                                ),
                              if (assignForms.questions[index].type == "radio")
                                Container(
                                    width: size.width * .8,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: assignForms.questions[index]
                                            .radioValues.length,
                                        itemBuilder: (context, radioIndex) {
                                          return Obx(() => RadioWidget(
                                                title: assignForms
                                                    .questions[index]
                                                    .radioValues[radioIndex]
                                                    .title,
                                                value:
                                                    controller.changeState.value
                                                        ? radioIndex
                                                        : radioIndex,
                                                groupValue: assignForms
                                                    .questions[index]
                                                    .radioValues[0]
                                                    .index,
                                                onChanged: (value) {
                                                  assignForms
                                                      .questions[index]
                                                      .radioValues[0]
                                                      .index = value;
                                                  controller.changeState.value =
                                                      !controller
                                                          .changeState.value;
                                                  controller.radioList
                                                      .removeWhere((element) =>
                                                          element["id"] ==
                                                          assignForms
                                                              .questions[index]
                                                              .id
                                                              .toString());
                                                  controller.radioList.add({
                                                    "id": assignForms
                                                        .questions[index].id
                                                        .toString(),
                                                    "answer": assignForms
                                                        .questions[index]
                                                        .radioValues[radioIndex]
                                                        .title
                                                        .toString()
                                                  });
                                                },
                                              ));
                                        })),
                              if (assignForms.questions[index].type ==
                                  "checkbox")
                                Container(
                                    width: size.width * .8,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: assignForms.questions[index]
                                            .checkboxValues.length,
                                        itemBuilder: (context, checkIndex) {
                                          return Obx(() => CheckBoxWidget(
                                                title: assignForms
                                                    .questions[index]
                                                    .checkboxValues[checkIndex]
                                                    .title,
                                                value: controller
                                                        .changeStateCheck.value
                                                    ? assignForms
                                                        .questions[index]
                                                        .checkboxValues[
                                                            checkIndex]
                                                        .value
                                                    : assignForms
                                                        .questions[index]
                                                        .checkboxValues[
                                                            checkIndex]
                                                        .value,
                                                onChanged: (value) {
                                                  assignForms
                                                      .questions[index]
                                                      .checkboxValues[
                                                          checkIndex]
                                                      .value = value;
                                                  controller.changeStateCheck
                                                          .value =
                                                      !controller
                                                          .changeStateCheck
                                                          .value;
                                                  if (value!) {
                                                    controller.checkList.add({
                                                      "id": assignForms
                                                          .questions[index].id
                                                          .toString(),
                                                      "answer": assignForms
                                                          .questions[index]
                                                          .checkboxValues[
                                                              checkIndex]
                                                          .title
                                                          .toString(),
                                                    });
                                                  } else {
                                                    controller.checkList
                                                        .removeWhere(
                                                            (item) => mapEquals(
                                                                item,
                                                                ({
                                                                  "id": assignForms
                                                                      .questions[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  "answer": assignForms
                                                                      .questions[
                                                                          index]
                                                                      .checkboxValues[
                                                                          checkIndex]
                                                                      .title
                                                                      .toString(),
                                                                })));
                                                  }
                                                },
                                              ));
                                        })),
                              if (assignForms.questions[index].type ==
                                  "dropdown")
                                Container(
                                    width: size.width * .73,
                                    child: Obx(() {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * .01,
                                          ),
                                          DropdownButton(
                                              isExpanded: controller
                                                      .changeStateDrop.value
                                                  ? true
                                                  : true,
                                              value: assignForms
                                                  .questions[index]
                                                  .selectedDropdownVal,
                                              items: [
                                                ...(assignForms.questions[index]
                                                        .dropdownValues as List)
                                                    .map((e) =>
                                                        DropdownMenuItem(
                                                            value: e.title,
                                                            child: Text(e.title
                                                                .toString())))
                                              ],
                                              onChanged: (value) {
                                                assignForms.questions[index]
                                                        .selectedDropdownVal =
                                                    value;
                                                controller
                                                        .changeStateDrop.value =
                                                    !controller
                                                        .changeStateDrop.value;
                                                controller.dropList.removeWhere(
                                                    (element) =>
                                                        element["id"] ==
                                                        assignForms
                                                            .questions[index].id
                                                            .toString());
                                                controller.dropList.add({
                                                  "id": assignForms
                                                      .questions[index].id
                                                      .toString(),
                                                  "answer": value.toString()
                                                });
                                              }),
                                          SizedBox(
                                            height: size.height * .02,
                                          )
                                        ],
                                      );
                                    })),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height * .025,
                ),
                Container(
                    width: size.width * .75,
                    height: size.height * .06,
                    child: ButtonWidget(
                      buttonText: "Submit",
                      onPressed: () async {
                        if (controller.globalKey.currentState!.validate()) {
                          try {
                            controller.globalKey.currentState!.save();
                            var userId = await controller.getUserId();
                            var formId1 = formId;
                            var textList = controller.textList;
                            var emailList = controller.emailList;
                            var numberList = controller.numberList;
                            var dateList = controller.dateList;
                            var radioList = controller.radioList;
                            var checkList = controller.checkList;
                            var dropList = controller.dropList;

                            var allAnswers = jsonEncode(textList +
                                emailList +
                                numberList +
                                dateList +
                                checkList +
                                radioList +
                                dropList);

                            var req = SubmitFormsModel(
                              userId: userId.toString(),
                              formId: formId1.toString(),
                              answer: allAnswers.toString(),
                            );
                            await HttpServices.postSubmit(req).then((res) {
                              if (res.statusCode == 200) {
                                controller.textControllerList.clear();
                                controller.emailControllerList.clear();
                                controller.numberControllerList.clear();
                                controller.dateControllerList.clear();
                                controller.textList.clear();
                                controller.emailList.clear();
                                controller.numberList.clear();
                                controller.dateList.clear();
                                controller.radioList.clear();
                                controller.checkList.clear();
                                controller.dropList.clear();

                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          title: const Text(
                                            "Dynamic Forms",
                                          ),
                                          content: const Text(
                                            "Form Submitted Successfull",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Okay',
                                              ),
                                            ),
                                          ],
                                        ));

                                print("Submit Successfull");
                              } else {
                                print(res.body);
                              }
                            });
                          } finally {}
                        }
                      },
                    )),
                SizedBox(
                  height: size.height * .025,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
