import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';
import 'package:urgent/pages/home/controller.dart';
import 'package:urgent/pages/posts/controller.dart';
import 'controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<PostsController>(() => PostsController());
  }
}