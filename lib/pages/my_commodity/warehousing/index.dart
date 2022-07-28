import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';


class WarehousingPage extends GetView<WarehousingController> {
  _goods() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          title: Text("條碼"),
          subtitle: Text(controller.goods.data!.barcode!),
        ),
        ListTile(
          title: Text("商品名稱"),
          subtitle: Text(controller.goods.data!.name!),
        ),
        ListTile(
          title: Text("商品成本"),
          subtitle: Text("${controller.goods.data!.cost!}"),
        ),
        ListTile(
          title: Text("商品价格"),
          subtitle: Text("${controller.goods.data!.price!}"),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.numberProducts,
          decoration: InputDecoration(
            label: Text("入库数量"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.cost,
          decoration: InputDecoration(
            label: Text("总成本"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.costOl,
          decoration: InputDecoration(
            label: Text("单一商品成本"),
          ),
        ),

        ElevatedButton(onPressed: () {
          controller.warehousing();
        }, child: Text("入库")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarehousingController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "入库",
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
