class MCategory {
  String? name;
  String? logo;
  int? id;
  int? productCount;

  MCategory({this.name, this.logo, this.id, this.productCount});

  MCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    id = json['id'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['logo'] = logo;
    data['id'] = id;
    data['product_count'] = productCount;
    return data;
  }
}