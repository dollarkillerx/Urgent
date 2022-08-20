import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/inventory.dart';
import 'package:urgent/pages/my_commodity/out_stock/provider.dart';
import '../../../common/entity/good.dart';
import '../../../common/library/base_provider.dart';

class OutStockController extends GetxController {
  final Good goods = Get.arguments["goods"];

  var numberProducts = TextEditingController();
  var cost = TextEditingController();
  var remark = TextEditingController();
  var totalPrice = TextEditingController();
  var price = TextEditingController();
  var grossProfit = TextEditingController();

  RxString numberProductsText = ''.obs;
  RxString totalPriceText = ''.obs;

  OutStockProvider provider = Get.find();

  outStock() async {
    if (!(numberProducts.text.isNotEmpty && cost.text.isNotEmpty)) {
      Get.snackbar("Error", "缺少必填参数");
      return;
    }

    try {
      var np = int.parse(numberProducts.text);
      var nc = double.parse(cost.text);
      var ncp = double.parse(totalPrice.text);
      var response = await provider.outStock(OutStock(
        barcode: goods.data!.barcode,
        cost: nc,
        numberProducts: np,
        price: ncp,
        remark: remark.text,
      ));
      var err = NetTools.CheckError(response.body);
      if (err != null) {
        Get.snackbar("Error", err);
        return;
      }
      Get.back(result: {"barcode": goods.data!.barcode,"up": "up"});
      Get.snackbar("Success", "出库成功");
    } catch (e) {
      Get.snackbar("Error", "参数不正确");
    }
  }

  @override
  void onInit() {
    numberProducts.addListener(() {
      numberProductsText.value = numberProducts.text;
    });

    totalPrice.addListener(() {
      totalPriceText.value = totalPrice.text;
    });

    debounce(
      numberProductsText,
      (value) {
        if (value.toString() == "") {
          cost.text = "0";
          totalPrice.text = "0";
          price.text = "0";
          return;
        }

        try {
          var tc = int.parse(value.toString());
          var pcost = tc.toDouble() * goods.data?.cost;
          cost.text = "${pcost}";

          var pPrice = tc.toDouble() * goods.data?.price;
          totalPrice.text = "${pPrice}";

          price.text = "${goods.data?.price}";

          grossProfit.text ="${pPrice - pcost}";
        } catch (e) {
          print(value.toString());
          cost.text = "0";
          totalPrice.text = "0";
          price.text = "0";
          Get.snackbar("Error", "参数类型不正确");
        }
      },
      time: Duration(milliseconds: 100),
    );

    debounce(
      totalPriceText,
      (value) {
        if (value.toString() == "") {
          price.text = "0";
          return;
        }

        try {
          var cst = double.parse(cost.text);
          var tc = double.parse(value.toString());
          var nc = int.parse(numberProducts.text);
          price.text = "${tc / nc}";
          grossProfit.text ="${tc - cst}";
        } catch (e) {
          print(value.toString());
          price.text = "0";
          // Get.snackbar("Error", "参数类型不正确");
        }
      },
      time: Duration(milliseconds: 100),
    );

    super.onInit();
  }
}
