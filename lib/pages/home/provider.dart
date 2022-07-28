import 'package:get/get.dart';
import '../../common/library/base_provider.dart';

class HomeProvider extends BaseProvider {
  // Future<Response> search() => get("/search");
  Future<Response> search(String keyword) => get("/search",query: {"keyword": keyword});
}