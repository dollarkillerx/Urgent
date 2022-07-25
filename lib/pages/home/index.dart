import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Account"),
          onPressed: () {
            Get.toNamed(AppRoutes.ACCOUNT,arguments: {
              'name': 'Dollar Killer',
            });
          },
        ),
      ),
    );
  }
}
