abstract class MProductBase {
  String? name;
  num? price;
  String? logo;
  num? offerPrice;
  String? description;
  int? id;
  List<String>? images;
  int percentage = 0;
  bool? isLiked;
}

class MProducts extends MProductBase {
  MProducts({name, price, logo, offerPrice, description, id, images,});

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
    final diff = price! - offerPrice!;
    percentage = ((diff / price!) * 100).toInt();
    isLiked = json["is_liked"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['logo'] = logo;
    data['offer_price'] = offerPrice;
    data['description'] = description;
    data['id'] = id;
    data['images'] = images;
    return data;
  }
}
