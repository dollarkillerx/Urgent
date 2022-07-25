import 'package:get/get.dart';
import 'controller.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsController>(() => PostsController());
  }
}