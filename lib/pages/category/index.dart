import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'controller.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: GetBuilder<CategoryController>(builder: (controller) {
        return Column(
          children: <Widget>[
            controller.up(),
            controller.showUserList(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(CupertinoIcons.person),
                backgroundColor: Colors.blue,
              ),
              title: Text("添加账户"),
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.ACCOUNT);
              },
            ),

          ],
        );
      }),
    ));
  }
}
