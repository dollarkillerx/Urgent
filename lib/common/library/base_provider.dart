import 'package:get/get.dart';
import 'package:urgent/common/routes/app_routes.dart';
import '../entity/gener_resp.dart';
import '../entity/jwt.dart';
import '../storage/user_info.dart';

// const SERVER_API_URL = "http://192.168.31.231:8574/api/v1";
const SERVER_API_URL = "https://inventory.worldlink.net.cn/api/v1";

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
    httpClient.baseUrl = SERVER_API_URL;

    // 请求拦截
    httpClient.addRequestModifier<void>((request) async {
      ActiveUser? r = await UserInfoData.getActiveAccount();
      if (r != null) {
        String? rx = await UserInfoData.getUserJWT(r.account!);
        if (rx != null) {
          request.headers['Authorization'] = rx;
        }
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
