class IOList {
  String? requestId;
  String? code;
  IOListData? data;

  IOList({this.requestId, this.code, this.data});

  IOList.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    data = json['data'] != null ? new IOListData.fromJson(json['data']) : null;
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

class IOListData {
  int? count;
  List<IOListItem>? items;

  IOListData({this.count, this.items});

  IOListData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <IOListItem>[];
      json['items'].forEach((v) {
        items!.add(new IOListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IOListItem {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? inventoryType;
  String? orderId;
  String? barcode;
  String? goodsId;
  String? goodsName;
  String? account;
  num? totalPrice;
  num? grossProfit;
  num? totalCost;
  num? numberProducts;
  String? remark;

  IOListItem(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.inventoryType,
      this.orderId,
      this.barcode,
      this.goodsId,
      this.goodsName,
      this.account,
      this.totalPrice,
      this.grossProfit,
      this.totalCost,
      this.numberProducts,
      this.remark});

  IOListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    inventoryType = json['inventory_type'];
    orderId = json['order_id'];
    barcode = json['barcode'];
    goodsId = json['goods_id'];
    goodsName = json['goods_name'];
    account = json['account'];
    totalPrice = json['total_price'];
    grossProfit = json['gross_profit'];
    totalCost = json['total_cost'];
    numberProducts = json['number_products'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['inventory_type'] = this.inventoryType;
    data['order_id'] = this.orderId;
    data['barcode'] = this.barcode;
    data['goods_id'] = this.goodsId;
    data['goods_name'] = this.goodsName;
    data['account'] = this.account;
    data['total_price'] = this.totalPrice;
    data['gross_profit'] = this.grossProfit;
    data['total_cost'] = this.totalCost;
    data['number_products'] = this.numberProducts;
    data['remark'] = this.remark;
    return data;
  }
}
