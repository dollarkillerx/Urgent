import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(child: Text("AccountPage ${controller.name}"),),
    );
  }
}