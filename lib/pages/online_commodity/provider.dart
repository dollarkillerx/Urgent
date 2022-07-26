import 'package:urgent/common/entity/net_goods.dart';
import 'package:urgent/common/library/api_request.dart';

class GoodsProvider {
  Future<void> getGoodsData({
    required String barcode,
    required Function(NetGoods posts) onSuccess,
    Function(dynamic error)? onError,
  }) async {
    print('https://openapi.worldlink.net.cn/v1/barcodes/$barcode');
    await ApiRequest(url: 'https://openapi.worldlink.net.cn/v1/barcodes/$barcode',data: null).get(
      onSuccess: (data) {
        Map<String, dynamic> postsJson = data as Map<String, dynamic>;
        NetGoods posts = NetGoods.fromJson(postsJson);
        onSuccess(posts);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
