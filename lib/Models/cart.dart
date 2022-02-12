class MCart {
  String? productName;
  num? price;
  String? logo;
  num? offerPrice;
  int? quantity;
  int? id;
  int? productId;

  MCart(
      {this.productName,
      this.price,
      this.logo,
      this.offerPrice,
      this.quantity,
      this.id,
      this.productId});

  MCart.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    logo = json['logo'];
    offerPrice = json['offer_price'];
    quantity = json['quantity'];
    id = json['id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['logo'] = this.logo;
    data['offer_price'] = this.offerPrice;
    data['quantity'] = this.quantity;
    data['id'] = this.id;
    data['product_id'] = this.productId;
    return data;
  }
}