import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/jiugongge.dart';
import 'controller.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ToolsPage extends GetView<ToolsController> {
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', '返回', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = '获取平台版本失败.';
    }
    controller.setScanBarcode(barcodeScanRes) ;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToolsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tools 工具箱",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          // childAspectRatio: 1.6,
          children: <Widget>[
            Jiugongge(
              icon: Icons.qr_code,
              title: "在綫掃描商品",
              onTap: () {
                scanBarcodeNormal();
              },
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
            Jiugongge(
              icon: Icons.webhook_sharp,
              title: "開發中...",
            ),
          ],
        ),
      );
    });
  }
}

// class ToolsPage extends GetView<ToolsController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ToolsController>(builder: (controller) {
//       return Text("data");
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "DashBoard",
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Text(""),
//     );
//   }
// }
