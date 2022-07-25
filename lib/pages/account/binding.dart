import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}