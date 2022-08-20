import 'package:get/get.dart';
import 'package:urgent/common/entity/io_history.dart';
import 'package:urgent/pages/my_commodity/io_history/provider.dart';
import '../../../common/entity/good.dart';
import '../../../common/library/base_provider.dart';
import 'package:flutter/material.dart';

import '../../../widget/dialog.dart';


class IOHistoryController extends GetxController {
  final Good goods = Get.arguments["goods"];
  var isLoading = true;
  IOHistory? ioHistory;

  IOHistoryProvider provider = Get.find();

  @override
  void onInit() async {
    await flashPage();
    super.onInit();
  }

  flashPage() async {
    Response response = await provider.ioHistory(goods.data!.id!);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      isLoading = false;
      update();
      return;
    }

    ioHistory = IOHistory.fromJson(response.body);
    isLoading = false;
    update();
  }

  deleteOrder(BuildContext context, String orderID, String content) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: '請確認刪除',
            content: content,
            confirmCallback: () async {
              isLoading = true;
              update();

              Response response = await provider.ioRevoke(orderID);
              var err = NetTools.CheckError(response.body);
              if (err != null) {
                isLoading = false;
                Get.snackbar("錯誤", "$err");
                update();
                return;
              }

              ioHistory = IOHistory.fromJson(response.body);
              isLoading = false;
              Get.snackbar("SUCCESS", "刪除成功");
              update();
            },
          );
        }
    );
  }
}
