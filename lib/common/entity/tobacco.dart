class Tobacco {
  String? id;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? dataSource;
  String? sourceId;
  String? boxCode;
  String? barCode;
  String? name;
  String? specification;
  String? proPlace;
  int? packQuantity;
  int? price;
  int? tarContent;

  Tobacco(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.dataSource,
        this.sourceId,
        this.boxCode,
        this.barCode,
        this.name,
        this.specification,
        this.proPlace,
        this.packQuantity,
        this.price,
        this.tarContent});

  Tobacco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dataSource = json['data_source'];
    sourceId = json['source_id'];
    boxCode = json['box_code'];
    barCode = json['bar_code'];
    name = json['name'];
    specification = json['specification'];
    proPlace = json['pro_place'];
    packQuantity = json['pack_quantity'];
    price = json['price'];
    tarContent = json['tar_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['data_source'] = this.dataSource;
    data['source_id'] = this.sourceId;
    data['box_code'] = this.boxCode;
    data['bar_code'] = this.barCode;
    data['name'] = this.name;
    data['specification'] = this.specification;
    data['pro_place'] = this.proPlace;
    data['pack_quantity'] = this.packQuantity;
    data['price'] = this.price;
    data['tar_content'] = this.tarContent;
    return data;
  }
}
