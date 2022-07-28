import 'package:get/get.dart';
import 'package:urgent/pages/home/controller.dart';
import 'package:urgent/pages/home/provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeProvider>(() => HomeProvider());
  }
}