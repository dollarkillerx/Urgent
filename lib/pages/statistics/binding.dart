import 'package:get/get.dart';
import 'package:urgent/pages/statistics/provider.dart';

import 'controller.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(() => StatisticsController());
    Get.lazyPut<StatisticsProvider>(() => StatisticsProvider());
  }
}