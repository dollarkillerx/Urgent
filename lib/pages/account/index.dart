import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<AccountController>(builder: (controller) {
        return Container(
          child: ListView(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
            children: <Widget>[
              TextField(
                controller: controller.account,
                decoration: InputDecoration(
                  labelText: "Account",
                ),
              ),
              TextField(
                obscureText: true,
                controller: controller.password,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                controller.login();
              }, child: Text("Login"))
            ],
          ),
        );
      }),
    );
  }
}