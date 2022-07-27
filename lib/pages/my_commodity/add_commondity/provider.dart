import 'package:get/get.dart';
import 'package:urgent/common/entity/add_good.dart';
import '../../../common/library/base_provider.dart';
import 'dart:convert';

class AddCommodityProvider extends BaseProvider {
  Future<Response> addGood(AddGood addGood) => post("/good", json.encode(addGood));
}