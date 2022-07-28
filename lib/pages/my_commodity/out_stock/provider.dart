import 'package:get/get.dart';
import '../../../common/entity/inventory.dart';
import '../../../common/library/base_provider.dart';
import 'dart:convert';

class OutStockProvider extends BaseProvider {
  Future<Response> outStock(OutStock outStock) => post("/out_stock", json.encode(outStock));
}