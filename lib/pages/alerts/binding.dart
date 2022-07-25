import 'package:get/get.dart';
import 'controller.dart';

class AlertsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertsController>(() => AlertsController());
  }
}