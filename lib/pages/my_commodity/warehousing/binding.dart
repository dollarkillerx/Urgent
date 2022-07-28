import 'package:get/get.dart';
import 'package:urgent/pages/my_commodity/warehousing/provider.dart';
import 'controller.dart';

class WarehousingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehousingController>(() => WarehousingController());
    Get.lazyPut<WarehousingProvider>(() => WarehousingProvider());
  }
}