import 'package:dio/dio.dart';

class ApiRequest {
  late final String url; // late 需要保證調用一點會被初始化
  Map<String, dynamic>? data;

  ApiRequest({required this.url, this.data});

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      "Authorization": "B ....",
    }));
  }

  get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().get(url, queryParameters: data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}

