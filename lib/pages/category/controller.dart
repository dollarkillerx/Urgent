import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  @override
  Future<void> onInit() async {
    update();
    super.onInit();
  }

  // add() {
  //   abb += 1;
  //   update();
  //   return SizedBox();
  // }
}
