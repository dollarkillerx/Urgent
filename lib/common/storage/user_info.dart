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

    await UserInfoData.activeAccount(account, storehouse);
    await LocalStorage.setStringList("user_list", userList);
    await LocalStorage.setString(account, jwt);
  }

  static Future<List<UserJWT>?> userList() async {
    List<String>? userList =  await LocalStorage.getStringList("user_list");
    if (userList == null) {
      return null;
    }

    List<UserJWT> uList  = [];

    for (var value in userList) {
      UserJWT p = UserJWT.fromJson(json.decode(value));
      uList.add(p);
    }

    return uList;
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

    var atv = await UserInfoData.getActiveAccount();
    if (atv != null) {
      if (atv.account == account) {
        await LocalStorage.remove("active");
      }
    }

    await LocalStorage.setStringList("user_list", newList);
    await LocalStorage.remove(account);
  }
  
  static activeAccount(String account,String storehouse) async {
    await LocalStorage.setString("active", json.encode(ActiveUser(account: account,storehouse: storehouse)));
  }

  static Future<ActiveUser?> getActiveAccount() async {
    var value = await LocalStorage.getString("active");
    if (value == null) {
      return null;
    }
    ActiveUser p = ActiveUser.fromJson(json.decode(value));
    return p;
  }
}

