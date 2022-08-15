import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/inventory.dart';
import 'package:urgent/pages/my_commodity/warehousing/provider.dart';
import '../../../common/entity/good.dart';
import '../../../common/library/base_provider.dart';

class WarehousingController extends GetxController {
  final Good goods = Get.arguments["goods"];

  var numberProducts = TextEditingController();
  var cost = TextEditingController();
  var costOl = TextEditingController();
  var remark = TextEditingController();


  RxString controllerText = ''.obs;
  RxString controllerText2 = ''.obs;

  WarehousingProvider provider = Get.find();

  warehousing() async {
    if (!(numberProducts.text.isNotEmpty && cost.text.isNotEmpty)) {
      Get.snackbar("Error", "缺少必填参数");
      return;
    }

    try {
      var np = int.parse(numberProducts.text);
      var nc = double.parse(cost.text);
      var response = await provider.warehousing(Warehousing(
        barcode: goods.data!.barcode,
        cost: nc,
        remark: remark.text,
        numberProducts: np,
      ));
      var err = NetTools.CheckError(response.body);
      if (err != null) {
        Get.snackbar("Error", err);
        return;
      }
      Get.back(result: {"barcode": goods.data!.barcode});
      Get.snackbar("Success", "入库成功");
    } catch(e) {
      Get.snackbar("Error", "参数不正确");
    }
  }

  @override
  void onInit() {
    numberProducts.addListener(() {
      controllerText.value = numberProducts.text;
    });

    cost.addListener(() {
      controllerText2.value = cost.text;
    });

    debounce(
      controllerText,
      (value) {
        if (value.toString() == "") {
          cost.text = "0";
          return;
        }

        try {
          var tc = int.parse(value.toString());
          var pcost = tc.toDouble() * goods.data?.cost;
          cost.text = "${pcost}";
        } catch(e) {
          print(value.toString());
            Get.snackbar("Error", "参数类型不正确");
        }
      },
      time: Duration(milliseconds: 100),
    );

    debounce(
      controllerText2,
          (value) {
        if (value.toString() == "") {
          costOl.text = "0";
          return;
        }

        try {
          var tc = double.parse(value.toString());
          var nc = int.parse(numberProducts.text);
          costOl.text = "${tc/nc}";
        } catch(e) {
          print(value.toString());
          costOl.text = "0";
          // Get.snackbar("Error", "参数类型不正确");
        }
      },
      time: Duration(milliseconds: 100),
    );

    super.onInit();
  }
}
