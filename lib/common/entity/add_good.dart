class AddGood {
  String? barcode;
  String? name;
  String? spec;
  double? cost;
  double? price;
  String? brand;
  String? madeIn;
  String? img;
  String? remark;

  AddGood(
      {this.barcode,
        this.name,
        this.spec,
        this.cost,
        this.price,
        this.brand,
        this.madeIn,
        this.img,this.remark});

  AddGood.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    name = json['name'];
    spec = json['spec'];
    cost = json['cost'];
    price = json['price'];
    brand = json['brand'];
    madeIn = json['made_in'];
    img = json['img'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['spec'] = this.spec;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['made_in'] = this.madeIn;
    data['img'] = this.img;
    data['remark'] = this.remark;
    return data;
  }
}