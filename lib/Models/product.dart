abstract class MProductBase {
  String? name;
  num? price;
  String? logo;
  num? offerPrice;
  String? description;
  int? id;
  List<String>? images;
}

class MProducts extends MProductBase {
  MProducts({name, price, logo, offerPrice, description, id, images});

  MProducts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    logo = json['logo'];
    offerPrice = json['offer_price'];
    description = json['description'];
    id = json['id'];
    if (json['images'] != null) {
      images = json['images'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['logo'] = this.logo;
    data['offer_price'] = this.offerPrice;
    data['description'] = this.description;
    data['id'] = this.id;
    data['images'] = this.images;
    return data;
  }
}
