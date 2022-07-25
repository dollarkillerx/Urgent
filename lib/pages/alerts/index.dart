import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class AlertsPage extends GetView<AlertsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("DashBoard"),
      // ),
      body: Center(child: Text("AlertsPage"),),
    );
  }
}