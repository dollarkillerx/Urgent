import 'package:get/get.dart';
import '../../../common/entity/inventory.dart';
import '../../../common/library/base_provider.dart';
import 'dart:convert';

class WarehousingProvider extends BaseProvider {
  Future<Response> warehousing(Warehousing warehousing) => post("/warehousing", json.encode(warehousing));
}