import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/good.dart';
import 'package:urgent/pages/my_commodity/provider.dart';
import '../../common/library/base_provider.dart';
import '../../common/routes/app_routes.dart';
import '../../widget/dialog.dart';

class MyCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  bool isLoading = true;
  String name = "";
  Good? good;

  MyCommodityProvider provider = Get.find();

  @override
  Future<void> onInit() async {
    await flashPage();
    super.onInit();
  }

  deleteGood(Good good) async {
    Get.dialog(CustomDialog(
      title: '請確認刪除',
      content:
          "名称: ${good.data!.name}  \n 条码: ${good.data!.barcode} \n 当前库存: ${good.data!.quantity}",
      confirmCallback: () async {
        isLoading = true;
        update();

        Response response = await provider.deleteGood(good.data!.id!);
        var err = NetTools.CheckError(response.body);
        if (err != null) {
          Get.snackbar("錯誤", err);
          isLoading = false;
          update();
          return;
        }

        isLoading = false;
        Get.snackbar("SUCCESS", "刪除成功");
        Get.offAllNamed(AppRoutes.DASHBOARD);
      },
    ));
  }

  flashPage() async {
    Response response = await provider.search(barcode);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      isLoading = false;
      update();
      return;
    }

    var god = Good.fromJson(response.body);
    name = god.data?.name ?? "";
    good = god;

    isLoading = false;
    update();
  }
}
