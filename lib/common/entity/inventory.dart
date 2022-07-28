class Warehousing {
  String? barcode;
  double? cost;
  int? numberProducts;

  Warehousing({this.barcode, this.cost, this.numberProducts});

  Warehousing.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    cost = json['cost'];
    numberProducts = json['number_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['cost'] = this.cost;
    data['number_products'] = this.numberProducts;
    return data;
  }
}

class OutStock {
  String? barcode;
  double? cost;
  int? numberProducts;
  double? price;

  OutStock({this.barcode, this.cost, this.numberProducts, this.price});

  OutStock.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    cost = json['cost'];
    numberProducts = json['number_products'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['cost'] = this.cost;
    data['number_products'] = this.numberProducts;
    data['price'] = this.price;
    return data;
  }
}
