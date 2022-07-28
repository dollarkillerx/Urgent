import 'package:get/get.dart';
import 'package:urgent/pages/my_commodity/out_stock/provider.dart';
import 'controller.dart';

class OutStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutStockController>(() => OutStockController());
    Get.lazyPut<OutStockProvider>(() => OutStockProvider());
  }
}