class MVariation {
  int? id;
  num? price;
  num? offerPrice;
  String? color;
  int? productId;
  List<String>? images;

  MVariation(
      {this.id,
      this.price,
      this.offerPrice,
      this.color,
      this.productId,
      this.images});

  MVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    offerPrice = json['offer_price'];
    color = json['color'];
    productId = json['product_id'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['color'] = color;
    data['product_id'] = productId;
    data['images'] = images;
    return data;
  }
}