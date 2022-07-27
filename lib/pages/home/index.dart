import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Center(
          child: Text("Home Page", style: TextStyle(fontSize: 20),),
        );
      },),
    );
  }
}
