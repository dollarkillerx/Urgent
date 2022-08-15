class Warehousing {
  String? barcode;
  double? cost;
  int? numberProducts;
  String? remark;

  Warehousing({this.barcode, this.cost, this.numberProducts,this.remark});

  Warehousing.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    cost = json['cost'];
    numberProducts = json['number_products'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['cost'] = this.cost;
    data['number_products'] = this.numberProducts;
    data['remark'] = this.remark;
    return data;
  }
}

class OutStock {
  String? barcode;
  String? remark;
  double? cost;
  int? numberProducts;
  double? price;

  OutStock({this.barcode, this.cost, this.numberProducts, this.price,this.remark});

  OutStock.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    remark = json['remark'];
    cost = json['cost'];
    numberProducts = json['number_products'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['remark'] = this.remark;
    data['cost'] = this.cost;
    data['number_products'] = this.numberProducts;
    data['price'] = this.price;
    return data;
  }
}
