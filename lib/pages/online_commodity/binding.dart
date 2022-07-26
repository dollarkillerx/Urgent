import 'package:get/get.dart';
import 'controller.dart';

class OnlineCommodityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnlineCommodityController>(() => OnlineCommodityController());
  }
}