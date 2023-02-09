import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class ModifyCommodityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModifyCommodityController>(() => ModifyCommodityController());
    Get.lazyPut<ModifyCommodityProvider>(() => ModifyCommodityProvider());
  }
}