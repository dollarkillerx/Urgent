import 'package:get/get.dart';
import '../../common/library/base_provider.dart';

class StatisticsProvider extends BaseProvider {
  Future<Response> statistics() => get("/statistics");
}