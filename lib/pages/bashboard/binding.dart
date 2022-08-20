import 'package:get/get.dart';
import 'package:urgent/pages/category/controller.dart';
import 'package:urgent/pages/home/controller.dart';
import 'package:urgent/pages/statistics/controller.dart';
import 'package:urgent/pages/statistics/provider.dart';
import 'package:urgent/pages/tools/controller.dart';
import '../home/provider.dart';
import 'controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<StatisticsController>(() => StatisticsController());
    // Get.put<ToolsController>(() => ToolsController());
    Get.put(ToolsController());
    Get.put(CategoryController());
    Get.put(HomeProvider());
    Get.put(StatisticsProvider());
  }
}