import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';


class OutStockPage extends GetView<OutStockController> {

  _goods() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          title: Text("條碼"),
          subtitle: Text(controller.barcode),
        ),
        TextField(
          controller: controller.name,
          decoration: InputDecoration(
            label: Text("商品名稱"),
          ),
        ),

        ElevatedButton(onPressed: () {
          controller.addGoods();
        }, child: Text("添加")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutStockController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "添加商品",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _goods(),
      );
    });
  }
}
