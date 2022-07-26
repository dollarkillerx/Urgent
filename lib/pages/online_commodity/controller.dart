import 'package:get/get.dart';
import 'package:urgent/common/entity/net_goods.dart';
import 'package:urgent/pages/online_commodity/provider.dart';

class OnlineCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  // final String barcode = "6902890232421";
  NetGoods? netGoods;
  bool isLoading = true;

  void getBarcode() {
    Future.delayed(Duration.zero, () async {
      await GoodsProvider().getGoodsData(
          barcode: barcode,
          onSuccess: ((resp) {
            netGoods = resp;
            isLoading = false;
            update();
          }),
          onError: (error) {
            isLoading = false;
            print(error);
            print('PostsProvider error');
            update();
          });
    });
  }
}
