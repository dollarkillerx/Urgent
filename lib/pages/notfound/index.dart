import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/routes/app_routes.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由没有找到"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        onTap: () => Get.offAllNamed(AppRoutes.HOME),
      ),
    );
  }
}