import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Obx(() => Text("Counter ${controller.counter.value}")),
              ElevatedButton(onPressed: (){
                controller.increaseCounter();
              }, child: Text("Increase")),
            ],
          ),
        ),
      ),
    );
  }
}