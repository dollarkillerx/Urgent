import 'package:get/get.dart';
import '../../common/library/base_provider.dart';

class MyCommodityProvider extends BaseProvider {
  Future<Response> search(String barcode) => get("/good/$barcode");
  Future<Response> deleteGood(String goodId) => delete("/good/$goodId");
}