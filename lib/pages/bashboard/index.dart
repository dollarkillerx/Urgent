import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/home/index.dart';
import 'package:urgent/pages/tools/index.dart';
import 'controller.dart';

class DashBoardPage extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: Container(
          // SafeArea 兼容各種屏幕
          child: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomePage(),
              ToolsPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,  // 固定
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          // showSelectedLabels: false, // 顯示選中的labels
          showUnselectedLabels: true,  // 顯示未選中的labels
          items: <BottomNavigationBarItem>[
            _bottomNavigationBarItem(CupertinoIcons.home, "Home"),
            _bottomNavigationBarItem(CupertinoIcons.briefcase, "Tools"),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
