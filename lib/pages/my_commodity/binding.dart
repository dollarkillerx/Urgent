import 'package:get/get.dart';
import 'package:urgent/pages/my_commodity/provider.dart';
import 'controller.dart';

class MyCommodityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCommodityController>(() => MyCommodityController());
    Get.lazyPut<MyCommodityProvider>(() => MyCommodityProvider());
  }
}