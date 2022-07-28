import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/pages/my_commodity/out_stock/provider.dart';

class OutStockController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  var name = TextEditingController();

  OutStockProvider provider = Get.find();

  addGoods() async {

    Get.snackbar("Success", "添加成功");
    Get.offAllNamed(AppRoutes.DASHBOARD);
  }
}
