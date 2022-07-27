import 'package:get/get.dart';
import 'package:urgent/pages/account/controller.dart';
import 'package:urgent/pages/account/provider.dart';
import '../../common/library/base_provider.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<AccountProvider>(() => AccountProvider());
  }
}