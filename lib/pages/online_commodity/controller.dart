import 'package:get/get.dart';
import 'package:urgent/common/entity/net_goods.dart';
import 'package:urgent/common/entity/tobacco.dart';
import 'package:urgent/pages/online_commodity/provider.dart';

class OnlineCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  NetGoods? netGoods;
  Tobacco? tobacco;
  bool isLoading = true;

  @override
  void onInit() {
    GoodsProvider().getGoodsData(
        barcode: barcode,
        onSuccess: ((resp) {
          netGoods = resp;
          isLoading = false;
          update();
        }),
        onError: (error) {
          GoodsProvider().getTobaccoData(
              barcode: barcode,
              onSuccess: ((resp) {
                tobacco = resp;
                isLoading = false;
                update();
              }),
              onError: (error) {
                isLoading = false;
                update();
              });
        });
    super.onInit();
  }
}
