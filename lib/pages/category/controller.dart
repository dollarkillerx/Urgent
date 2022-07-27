import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/common/storage/user_info.dart';
import '../../common/entity/jwt.dart';
import '../../common/routes/app_routes.dart';

class CategoryController extends GetxController {
  List<UserJWT>? userList;

  int abc = 0;

  @override
  Future<void> onInit() async {
    update();
    super.onInit();
  }

  showUserList() {
    if (userList == null) {
      return SizedBox();
    }

    List<Widget> t = [];
    for (var i in userList!) {
      t.add(
          ListTile(
            leading: Icon(Icons.pedal_bike_sharp),
            trailing: InkWell(
              child: Icon(Icons.logout,),
              onTap: () {
                UserInfoData.logout(i.account!);
                Get.offAllNamed(AppRoutes.DASHBOARD);
              },
            ),
            title: Text(i.storehouse!),
            subtitle: Text(i.account!),
            onTap: () {
              UserInfoData.activeAccount(i.account!,i.storehouse!);
              Get.offAllNamed(AppRoutes.DASHBOARD);
            },
          )
      );
    }

    return Column(
      children: [
        ...t
      ],
    );
  }

  up() {
    if (abc == 1) {
      abc = 0;
      return SizedBox();
    }
    UserInfoData.userList().then((value) => {
      this.userList = value, print(value),update(),abc = 1
    });
    return SizedBox();
  }
}
