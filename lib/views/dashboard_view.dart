import 'package:dynamic_forms_v1/controllers/dashboard_controller.dart';
import 'package:dynamic_forms_v1/views/assign_forms_view.dart';
import 'package:dynamic_forms_v1/views/drawer_view.dart';
import 'package:dynamic_forms_v1/views/submit_forms_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              "Dynamic Forms",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height * .025,
              ),
            ),
          ),
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Container(),
              AssignFormsView(),
              SubmitFormsView(),
            ],
          ),
          drawer: DrawerView(),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.orange,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black26,
              selectedFontSize: size.height * .017,
              iconSize: size.height * .035,
              unselectedFontSize: size.height * .017,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              items: [
                _bottomNavigationBarItem(
                  Icons.home,
                  "Home",
                ),
                _bottomNavigationBarItem(
                  Icons.segment_outlined,
                  "Assign Forms",
                ),
                _bottomNavigationBarItem(Icons.check, "Submit Forms"),
              ]),
        ));
  }

  _bottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
