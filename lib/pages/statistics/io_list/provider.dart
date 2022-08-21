import 'package:get/get.dart';
import '../../../common/library/base_provider.dart';

class IOListProvider extends BaseProvider {
  Future<Response> ioList(int offset, int limit) => post("/io_list", {
        "offset": offset,
        "limit": limit,
      });
}
