import 'package:get/get.dart';
import 'package:urgent/pages/statistics/io_list/provider.dart';
import 'controller.dart';

class IOListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOListController>(() => IOListController());
    Get.lazyPut<IOListProvider>(() => IOListProvider());
  }
}
