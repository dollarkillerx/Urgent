import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';
import 'package:urgent/pages/category/controller.dart';
import 'package:urgent/pages/home/controller.dart';
import 'package:urgent/pages/tools/controller.dart';
import '../account/provider.dart';
import 'controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ToolsController>(() => ToolsController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<AccountProvider>(() => AccountProvider());
    Get.put( CategoryController());
  }
}