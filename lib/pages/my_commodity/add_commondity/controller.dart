import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/add_good.dart';
import 'package:urgent/common/entity/up_file.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/pages/my_commodity/add_commondity/provider.dart';
import 'dart:io';
import '../../../common/library/base_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AddCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  File? image;

  var name = TextEditingController();
  var spec = TextEditingController();
  var brand = TextEditingController();
  var madeIn = TextEditingController();
  var price = TextEditingController();
  var cost = TextEditingController();
  String imgUrl = "";

  AddCommodityProvider provider = Get.find();

  setImg(File img) {
    image = img;
    update();
  }

  addGoods() async {
    if (!(name.text.isNotEmpty &&
        price.text.isNotEmpty &&
        cost.text.isNotEmpty)) {
      Get.snackbar("Error", "必填项未填写");
      return;
    }

    SmartDialog.showLoading(animationType: SmartAnimationType.scale);

    try {
      if (image != null) {
        var byt = await image!.readAsBytes();
        MultipartFile f =
        MultipartFile(byt, filename: image!.path);
        FormData form = FormData({
          'imgFile': f,
        });
        var r = await provider.uploadFile(form);
        var err = NetTools.CheckError(r.body);
        if (err != null) {
          Get.snackbar("Error", err);
          return;
        }

        UpFile fp = UpFile.fromJson(r.body);
        imgUrl = fp.data!.url!;
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
          img: imgUrl,
        );
      } catch (e) {
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
    } finally {
      SmartDialog.dismiss(status: SmartStatus.loading);
    }


  }
}
