import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'controller.dart';

class AddCommodityPage extends GetView<AddCommodityController> {

  // 相機
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      controller.image = imageTemp;
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

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
        TextField(
          controller: controller.spec,
          decoration: InputDecoration(
            label: Text("规格"),
          ),
        ),
        TextField(
          controller: controller.brand,
          decoration: InputDecoration(
            label: Text("品牌"),
          ),
        ),
        TextField(
          controller: controller.madeIn,
          decoration: InputDecoration(
            label: Text("產地"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.price,
          decoration: InputDecoration(
            label: Text("价格"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.cost,
          decoration: InputDecoration(
            label: Text("成本"),
          ),
        ),
        ElevatedButton(onPressed: () {
          pickImage();
        }, child: Text("拍照")),
        ElevatedButton(onPressed: () {
          controller.addGoods();
        }, child: Text("添加")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCommodityController>(builder: (controller) {
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