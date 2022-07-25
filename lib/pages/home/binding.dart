import 'package:get/get.dart';
import 'package:urgent/pages/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}