import 'package:get/get.dart';
import '../../common/library/base_provider.dart';

class MyCommodityProvider extends BaseProvider {
  Future<Response> search(String barcode) => get("/good/$barcode");
}