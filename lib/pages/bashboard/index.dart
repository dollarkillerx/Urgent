import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/home/index.dart';
import 'package:urgent/pages/statistics/index.dart';
import 'package:urgent/pages/tools/index.dart';
import '../category/index.dart';
import 'controller.dart';

class DashBoardPage extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context){
            return IconButton(
              icon: Icon(Icons.dehaze_sharp,color: Colors.black,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Container(
          // SafeArea 兼容各種屏幕
          child: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomePage(),
              StatisticsPage(),
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
            _bottomNavigationBarItem(CupertinoIcons.square_stack_3d_down_right, "統計"),
            _bottomNavigationBarItem(CupertinoIcons.briefcase, "Tools"),
          ],
        ),

        drawer: Drawer(
          child: CategoryPage(),
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
