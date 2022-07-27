import 'package:get/get.dart';
import 'package:urgent/common/routes/app_routes.dart';
import 'package:urgent/common/storage/localstorage.dart';

import '../entity/gener_resp.dart';

const SERVER_API_URL = "http://192.168.31.223:8574/api/v1";

class NetTools {
  static String? CheckError(Map<String, dynamic> postsJson) {
    GenericResp posts = GenericResp.fromJson(postsJson);
    if (posts.code != "0") {
      return posts.message;
    }
    return null;
  }
}

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://192.168.31.223:8574/api/v1";

    // 请求拦截
    httpClient.addRequestModifier<void>((request) async {
      String? r = await LocalStorage.getString("action_jwt");
      if (r != null) {
        request.headers['Authorization'] = r;
      }

      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      if (response.status.code! == 401) {
        Get.toNamed(AppRoutes.ACCOUNT);
      }
      return response;
    });
  }
}
