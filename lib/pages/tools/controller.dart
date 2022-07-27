import 'package:get/get.dart';

class ToolsController extends GetxController {
  String scanBarcode = '';
  void setScanBarcode(String code,int c1) {
    if (code == "") {
      return;
    }

    scanBarcode = code;
    if (scanBarcode.length != 13) {
      Get.snackbar(
        "Error",
        "錯誤的條碼  條碼長度應 = 13",
      );
      return;
    }

    switch (c1) {
      case 0:
        Get.toNamed("/home/online_commodity",arguments: {"barcode": this.scanBarcode});
        break;
      case 1:
        Get.toNamed("/home/my_commodity",arguments: {"barcode": this.scanBarcode});
    }
  }
}