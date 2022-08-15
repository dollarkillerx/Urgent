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
          readOnly: true,
          keyboardType: TextInputType.number,
          controller: controller.cost,
          decoration: InputDecoration(
            label: Text("总成本"),
          ),
        ),
        TextField(
          readOnly: true,
          keyboardType: TextInputType.number,
          controller: controller.grossProfit,
          decoration: InputDecoration(
            label: Text("毛利"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.numberProducts,
          decoration: InputDecoration(
            label: Text("出库数量"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.totalPrice,
          decoration: InputDecoration(
            label: Text("总价"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.price,
          decoration: InputDecoration(
            label: Text("单价"),
          ),
        ),
        TextField(
          controller: controller.remark,
          decoration: InputDecoration(
            label: Text("備注"),
          ),
        ),
        ElevatedButton(onPressed: () {
          controller.outStock();
        }, child: Text("出库")),
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
            "出库",
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
