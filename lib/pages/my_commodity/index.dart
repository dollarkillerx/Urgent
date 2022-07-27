import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/components/loading_overlay.dart';
import 'controller.dart';


class MyCommodityPage extends GetView<MyCommodityController> {
  _goods() {
    if (controller.good != null) {
      return ListView(
        children: <Widget>[
          ListTile(
            title: Text("條碼"),
            subtitle: Text(controller.barcode),
          ),
          ListTile(
            title: Text("商品名稱"),
            subtitle: Text(controller.good!.data!.name!),
          ),
          ListTile(
            title: Text("规格"),
            subtitle: Text(controller.good!.data!.spec!),
          ),
          ListTile(
            title: Text("品牌"),
            subtitle: Text(controller.good!.data!.brand!),
          ),
          ListTile(
            title: Text("產地"),
            subtitle: Text(controller.good!.data!.madeIn!),
          ),
          ListTile(
            title: Text("库存"),
            subtitle: Text("${controller.good!.data!.quantity!}"),
          ),
          ListTile(
            title: Text("价格"),
            subtitle: Text("${controller.good!.data!.price!} / 元"),
          ),
          ListTile(
            title: Text("成本"),
            subtitle: Text("${controller.good!.data!.cost!} / 元"),
          ),
          ListTile(
            title: Text("总成本"),
            subtitle: Text("${controller.good!.data!.totalCost!} 元"),
          ),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text("入库")),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text("出库")),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text("返回"))
        ],
      );
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text("當前條碼未查詢到網絡記錄 ${controller.barcode}"),
        ),
        ElevatedButton(onPressed: () {
          Get.toNamed("/home/add_commodity",arguments: {"barcode": controller.barcode});
        }, child: Text("添加商品")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCommodityController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "我的商品",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: LoadingOverlay(
          isLoading: controller.isLoading,
          child: _goods(),
        ),
      );
    });
  }
}
