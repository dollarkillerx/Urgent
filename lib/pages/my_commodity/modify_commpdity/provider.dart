import 'package:get/get.dart';
import 'package:urgent/common/entity/modify_good.dart';
import '../../../common/library/base_provider.dart';
import 'dart:convert';

class ModifyCommodityProvider extends BaseProvider {
  Future<Response> modifyGood(ModifyGoods modifyGood) => post("/good/update", json.encode(modifyGood));
  Future<Response> uploadFile(FormData fb) => post("/upload", fb);
  Future<Response> getGood(String barcode) => get("/good/$barcode");
}