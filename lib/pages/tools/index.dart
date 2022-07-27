import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/jiugongge.dart';
import 'controller.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ToolsPage extends GetView<ToolsController> {
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal(int c1) async {
    try {
      var result = await BarcodeScanner.scan();
      print(result.type); // The result type (barcode, cancelled, failed)
      print(result.rawContent); // The barcode content
      print(result.format); // The barcode format (as enum)
      print(result.formatNote); // If a unknown format was scanned this field contains a note
      controller.setScanBarcode(result.rawContent,c1);
    }on PlatformException {
      print("errpr");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToolsController>(builder: (controller) {
      return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          // childAspectRatio: 1.6,
          children: <Widget>[
            Jiugongge(
              icon: Icons.qr_code,
              title: "掃描網絡上的商品",
              onTap: () {
                scanBarcodeNormal(0);
              },
            ),
            Jiugongge(
              icon: Icons.qr_code_scanner_sharp,
              title: "我的商品",
              onTap: () {
                scanBarcodeNormal(1);
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
