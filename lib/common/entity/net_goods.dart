class NetGoods {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? barcode;
  String? name;
  String? spec;
  double? price;
  String? brand;
  String? supplier;
  String? madeIn;

  NetGoods(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.barcode,
        this.name,
        this.spec,
        this.price,
        this.brand,
        this.supplier,
        this.madeIn});

  NetGoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    barcode = json['barcode'];
    name = json['name'];
    spec = json['spec'];
    price = json['price'];
    brand = json['brand'];
    supplier = json['supplier'];
    madeIn = json['made_in'];
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
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['supplier'] = this.supplier;
    data['made_in'] = this.madeIn;
    return data;
  }
}
