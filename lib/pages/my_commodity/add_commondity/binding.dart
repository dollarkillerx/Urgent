import 'package:get/get.dart';
import 'package:urgent/pages/my_commodity/add_commondity/provider.dart';
import 'controller.dart';

class AddCommodityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCommodityController>(() => AddCommodityController());
    Get.lazyPut<AddCommodityProvider>(() => AddCommodityProvider());
  }
}