import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/components/loading_overlay.dart';
import 'package:urgent/components/r404.dart';
import 'controller.dart';

class OnlineCommodityPage extends GetView<OnlineCommodityController> {

  _goods() {
    if (controller.netGoods == null && controller.tobacco == null) {
      return R404(title: "當前條碼未查詢到網絡記錄    ${controller.barcode}",);
    }

    if (controller.netGoods != null) {
      return ListView(
        children: <Widget>[
          ListTile(
            title: Text("條碼"),
            subtitle: Text(controller.barcode),
          ),
          ListTile(
            title: Text("商品名稱"),
            subtitle: Text(controller.netGoods!.name!),
          ),
          ListTile(
            title: Text("Spec"),
            subtitle: Text(controller.netGoods!.spec!),
          ),
          ListTile(
            title: Text("品牌"),
            subtitle: Text(controller.netGoods!.brand!),
          ),
          ListTile(
            title: Text("公司"),
            subtitle: Text(controller.netGoods!.supplier!),
          ),
          ListTile(
            title: Text("產地"),
            subtitle: Text(controller.netGoods!.madeIn!),
          ),
          ListTile(
            title: Text("價格"),
            subtitle: Text("${controller.netGoods!.price!} 元"),
          ),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text("返回"))
        ],
      );
    }

    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("條碼"),
          subtitle: Text(controller.barcode),
        ),
        ListTile(
          title: Text("小盒條碼"),
          subtitle: Text(controller.tobacco!.boxCode!),
        ),
        ListTile(
          title: Text("大盒條碼"),
          subtitle: Text(controller.tobacco!.barCode!),
        ),
        ListTile(
          title: Text("名稱"),
          subtitle: Text(controller.tobacco!.name!),
        ),
        ListTile(
          title: Text("類型"),
          subtitle: Text(controller.tobacco!.specification!),
        ),
        ListTile(
          title: Text("產地"),
          subtitle: Text(controller.tobacco!.proPlace!),
        ),
        ListTile(
          title: Text("每包條數"),
          subtitle: Text("${controller.tobacco!.packQuantity!} 支"),
        ),
        ListTile(
          title: Text("市場參考價"),
          subtitle: Text("${controller.tobacco!.price!} 元/包(小包)"),
        ),
        ListTile(
          title: Text("焦油量"),
          subtitle: Text("${controller.tobacco!.tarContent!} mg/支"),
        ),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineCommodityController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "網絡商品條碼價差查詢",
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
