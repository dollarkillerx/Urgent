import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/components/loading_overlay.dart';
import 'package:urgent/components/r404.dart';
import 'controller.dart';

class OnlineCommodityPage extends GetView<OnlineCommodityController> {

  _goods() {
    controller.getBarcode();
    if (controller.netGoods == null) {
      return R404(title: "當前條碼未查詢到網絡記錄",);
    }

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineCommodityController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tools 工具箱",
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
