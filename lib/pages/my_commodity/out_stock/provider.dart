import 'package:get/get.dart';
import 'package:urgent/common/entity/add_good.dart';
import '../../../common/library/base_provider.dart';
import 'dart:convert';

class OutStockProvider extends BaseProvider {
  Future<Response> addGood(AddGood addGood) => post("/good", json.encode(addGood));
  Future<Response> uploadFile(FormData fb) => post("/upload", fb);
}