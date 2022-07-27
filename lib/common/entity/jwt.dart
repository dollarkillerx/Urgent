class JWT {
  String? requestId;
  String? code;
  Data? data;

  JWT({this.requestId, this.code, this.data});

  JWT.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? jwt;
  String? storehouse;

  Data({this.jwt, this.storehouse});

  Data.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    storehouse = json['storehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    data['storehouse'] = this.storehouse;
    return data;
  }
}

class UserJWT {
  String? account;
  String? jwt;
  String? storehouse;

  UserJWT({this.account, this.jwt, this.storehouse});

  UserJWT.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    jwt = json['jwt'];
    storehouse = json['storehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['jwt'] = this.jwt;
    data['storehouse'] = this.storehouse;
    return data;
  }
}

class ActiveUser {
  String? account;
  String? storehouse;

  ActiveUser({this.account, this.storehouse});

  ActiveUser.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    storehouse = json['storehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['storehouse'] = this.storehouse;
    return data;
  }
}