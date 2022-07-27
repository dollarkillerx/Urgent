import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/jwt.dart';
import 'package:urgent/common/library/base_provider.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/common/storage/user_info.dart';
import 'package:urgent/pages/account/provider.dart';

class AccountController extends GetxController {
  var account = TextEditingController();
  var password = TextEditingController();

  AccountProvider provider = Get.find();

  login() async {
    if (!account.value.text.isNotEmpty || !password.value.text.isNotEmpty) {
      Get.snackbar("Error", "参数错误 用户名或密码不能为空");
      return;
    }

    var jwt1 = await UserInfoData.getUserJWT(account.value.text);
    if (jwt1 != null) {
      Get.snackbar("Error", "请勿重复登陆");
      return;
    }

    Response response =
        await provider.login(account.value.text, password.value.text);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      Get.snackbar("Error", err);
      return;
    }

    JWT jwt = JWT.fromJson(response.body);
    // 存储数据

    await UserInfoData.setUserJWT(account.value.text, jwt.data!.jwt!, jwt.data!.storehouse!);

    Get.snackbar("登陆成功", "店铺名称: ${jwt.data!.storehouse}");
    Get.offAllNamed(AppRoutes.DASHBOARD);
  }
}
