import 'package:get/get_connect/http/src/response/response.dart';

import '../../../common/library/base_provider.dart';

class IOHistoryProvider extends BaseProvider {
  Future<Response> ioHistory(String goodID) => get("/io_history/$goodID");
}