import 'package:get/get.dart';
import 'package:urgent/pages/my_commodity/io_history/provider.dart';
import 'controller.dart';

class IOHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOHistoryController>(() => IOHistoryController());
    Get.lazyPut<IOHistoryProvider>(() => IOHistoryProvider());
  }
}