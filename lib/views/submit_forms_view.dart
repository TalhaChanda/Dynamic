import 'package:dynamic_forms_v1/controllers/assign_forms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitFormsView extends StatelessWidget {
  const SubmitFormsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AssignFormsController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        padding: EdgeInsets.all(size.height * .015),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.assignForms!.forms!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    child: ListTile(
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setInt('formId',
                            controller.assignForms!.forms![index].formId!);
                        await preferences.setString('formSubTitle',
                            controller.assignForms!.forms![index].formTitle!);
                        Get.toNamed(
                          "/SubmitFormsDetails",
                        );
                      },
                      title: Text(
                          '${controller.assignForms!.forms![index].formTitle}'),
                      subtitle: Text(
                          '${controller.assignForms!.forms![index].formDescription}'),
                      leading: Icon(
                        Icons.segment_outlined,
                        size: size.height * .035,
                        color: Colors.orange,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: size.height * .03,
                        color: Colors.orange,
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
