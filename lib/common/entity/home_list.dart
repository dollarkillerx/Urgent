class HomeList {
  String? requestId;
  String? code;
  List<Data>? data;

  HomeList({this.requestId, this.code, this.data});

  HomeList.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? barcode;
  String? name;
  String? spec;
  dynamic? cost;
  dynamic? price;
  String? brand;
  String? madeIn;
  String? img;
  String? byAccount;
  int? quantity;
  dynamic? totalCost;

  Data(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.barcode,
        this.name,
        this.spec,
        this.cost,
        this.price,
        this.brand,
        this.madeIn,
        this.img,
        this.byAccount,
        this.quantity,
        this.totalCost});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    barcode = json['barcode'];
    name = json['name'];
    spec = json['spec'];
    cost = json['cost'];
    price = json['price'];
    brand = json['brand'];
    madeIn = json['made_in'];
    img = json['img'];
    byAccount = json['by_account'];
    quantity = json['quantity'];
    totalCost = json['total_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['spec'] = this.spec;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['made_in'] = this.madeIn;
    data['img'] = this.img;
    data['by_account'] = this.byAccount;
    data['quantity'] = this.quantity;
    data['total_cost'] = this.totalCost;
    return data;
  }
}
