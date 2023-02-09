class ModifyGoods {
  String? id;
  String? name;
  String? spec;
  double? cost;
  double? price;
  String? brand;
  String? madeIn;
  String? img;

  ModifyGoods(
      {this.id,
        this.name,
        this.spec,
        this.cost,
        this.price,
        this.brand,
        this.madeIn,
        this.img});

  ModifyGoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    spec = json['spec'];
    cost = json['cost'];
    price = json['price'];
    brand = json['brand'];
    madeIn = json['made_in'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['spec'] = this.spec;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['made_in'] = this.madeIn;
    data['img'] = this.img;
    return data;
  }
}