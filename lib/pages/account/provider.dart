import 'package:get/get.dart';
import 'package:urgent/common/library/base_provider.dart';

class AccountProvider extends BaseProvider {
  Future<Response> login(String account,String password) => post("/login", {"account": account,"password": password});
}