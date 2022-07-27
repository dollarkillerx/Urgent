import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/add_good.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/pages/my_commodity/add_commondity/provider.dart';
import 'dart:io';
import 'dart:async';
import '../../../common/library/base_provider.dart';

class AddCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  File? image;

  var name = TextEditingController();
  var spec = TextEditingController();
  var brand = TextEditingController();
  var madeIn = TextEditingController();
  var price = TextEditingController();
  var cost = TextEditingController();
  AddCommodityProvider provider = Get.find();

  addGoods() async {
    if (!(name.text.isNotEmpty && price.text.isNotEmpty && cost.text.isNotEmpty)) {
      Get.snackbar("Error", "必填项未填写");
      return;
    }


    late AddGood good;
    try {
      good = AddGood(
        barcode: this.barcode,
        name: name.text,
        spec: spec.text,
        brand: brand.text,
        madeIn: madeIn.text,
        cost: double.parse(cost.text),
        price: double.parse(price.text),
      );
    }
    catch (e) {
      Get.snackbar("Error", "参数非法");
      return;
    }

    Response response = await provider.addGood(good);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      Get.snackbar("Error", err);
      return;
    }

    Get.snackbar("Success", "添加成功");
    Get.offAllNamed(AppRoutes.DASHBOARD);
  }
}
