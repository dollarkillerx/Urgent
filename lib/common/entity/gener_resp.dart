class GenericResp {
  String? requestId;
  String? code;
  String? message;

  GenericResp({this.requestId, this.code, this.message});

  GenericResp.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}