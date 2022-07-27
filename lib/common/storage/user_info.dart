import 'package:urgent/common/entity/jwt.dart';
import 'package:urgent/common/storage/localstorage.dart';
import 'dart:convert';

class UserInfoData {

  static Future<String?> getUserJWT(String account) async {
    var jwt = await LocalStorage.getString(account);
    return jwt;
  }

  static setUserJWT(String account, String jwt,String storehouse) async {
    List<String>? userList =  await LocalStorage.getStringList("user_list");
    userList ??= [];
    userList.add(json.encode(UserJWT(account: account,jwt: jwt,storehouse: storehouse).toJson()));

    await LocalStorage.setStringList("user_list", userList);
    await LocalStorage.setString(account, jwt);
  }

  static logout(String account) async {
    List<String>? userList =  await LocalStorage.getStringList("user_list");
    userList ??= [];

    List<String> newList  = [];

    for (var value in userList) {
      UserJWT p = UserJWT.fromJson(json.decode(value));
      if (p.account != account) {
        newList.add(value);
      }
    }

    await LocalStorage.setStringList("user_list", newList);
    await LocalStorage.remove(account);
  }
}

