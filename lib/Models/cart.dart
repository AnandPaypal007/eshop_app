import 'package:eshop/Models/product.dart';

class MCart extends MProducts {
  int? quantity;
  int? productId;

  MCart({
    this.quantity,
  });

  MCart.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    logo = json['image'];
    offerPrice = json['offer_price'];
    description = json['description'];
    quantity = json["quantity"] ?? 0;
    id = json['id'];
    productId = json['product_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['product_name'] = this.productName;
  //   data['price'] = this.price;
  //   data['logo'] = this.logo;
  //   data['offer_price'] = this.offerPrice;
  //   data['quantity'] = this.quantity;
  //   data['id'] = this.id;
  //   data['product_id'] = this.productId;
  //   return data;
  // }
}
