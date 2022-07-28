import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/good.dart';
import 'package:urgent/pages/my_commodity/provider.dart';
import '../../common/library/base_provider.dart';

class MyCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  bool isLoading = true;
  Good? good;

  int abc = 0;

  MyCommodityProvider provider = Get.find();

  netData() {
    if (abc == 1) {
      abc = 0;
      return SizedBox();
    }

    print("object");
    provider.search(barcode).then((response) => {
      () {
        abc = 1;
        print("object cccccc");
        var err = NetTools.CheckError(response.body);
        if (err != null) {
          isLoading = false;
          update();
          return;
        }

        good = Good.fromJson(response.body);
        isLoading = false;
        update();
      }()
    });

    return SizedBox();
  }

  @override
  Future<void> onInit() async {
    // Response response = await provider.search(barcode);
    // var err = NetTools.CheckError(response.body);
    // if (err != null) {
    //   isLoading = false;
    //   update();
    //   return;
    // }
    //
    // good = Good.fromJson(response.body);
    // isLoading = false;
    //
    // update();
    super.onInit();
  }
}
