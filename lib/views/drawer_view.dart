import 'package:dynamic_forms_v1/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(DrawerBarController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AppBar(
              automaticallyImplyLeading: false,
              title: GetBuilder<DrawerBarController>(builder: (con) {
                return Text(
                  con.userName.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * .025,
                  ),
                );
              })),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.orange,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(),
            ),
            onTap: () {
              controller.removeToken();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
