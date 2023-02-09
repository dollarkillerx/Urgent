import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/modify_good.dart';
import 'package:urgent/common/entity/up_file.dart';
import 'package:urgent/common/routes/app_routes.dart';
import '../../../common/entity/good.dart';
import 'provider.dart';
import 'dart:io';
import '../../../common/library/base_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ModifyCommodityController extends GetxController {
  bool isLoading = false;
  late Good goods = Get.arguments["goods"];

  File? image;

  var name = TextEditingController();
  var spec = TextEditingController();
  var brand = TextEditingController();
  var madeIn = TextEditingController();
  var price = TextEditingController();
  var cost = TextEditingController();
  String imgUrl = "";

  @override
  void onInit() {
    name.text = goods.data!.name ?? "";
    spec.text = goods.data!.spec ?? "";
    brand.text = goods.data!.brand ?? "";
    madeIn.text = goods.data!.madeIn ?? "";
    price.text = goods.data!.price.toString();
    cost.text = goods.data!.cost.toString();
    imgUrl = goods.data!.img ?? "";

    super.onInit();
  }

  ModifyCommodityProvider provider = Get.find();

  setImg(File img) {
    image = img;
    update();
  }

  addGoods() async {
    if (!(goods.data!.id!.isNotEmpty &&
        name.text.isNotEmpty &&
        price.text.isNotEmpty &&
        cost.text.isNotEmpty)) {
      Get.snackbar("Error", "必填项未填写");
      return;
    }

    SmartDialog.showLoading(animationType: SmartAnimationType.scale);

    // 上传文件
    try {
      if (image != null) {
        var byt = await image!.readAsBytes();
        MultipartFile f = MultipartFile(byt, filename: image!.path);
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

      late ModifyGoods good;
      try {
        good = ModifyGoods(
          id: goods.data!.id,
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

      Response response = await provider.modifyGood(good);
      var err = NetTools.CheckError(response.body);
      if (err != null) {
        Get.snackbar("Error", err);
        return;
      }

      Get.snackbar("Success", "修改成功");
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } finally {
      SmartDialog.dismiss(status: SmartStatus.loading);
    }
  }

  flashPage() async {
    Response response = await provider.getGood(goods.data!.barcode!);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      isLoading = false;
      update();
      return;
    }

    var god = Good.fromJson(response.body);
    goods = god;
    name.text = goods.data!.name ?? "";
    spec.text = goods.data!.spec ?? "";
    brand.text = goods.data!.brand ?? "";
    madeIn.text = goods.data!.madeIn ?? "";
    price.text = goods.data!.price.toString();
    cost.text = goods.data!.cost.toString();
    imgUrl = goods.data!.img ?? "";

    isLoading = false;
    update();
  }
}
