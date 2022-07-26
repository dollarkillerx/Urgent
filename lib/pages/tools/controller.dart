import 'package:get/get.dart';

class ToolsController extends GetxController {
  String scanBarcode = '';
  void setScanBarcode(String code) {
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

    Get.toNamed("/home/online_commodity",arguments: {"barcode": this.scanBarcode});
  }
}