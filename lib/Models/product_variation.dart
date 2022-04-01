import 'package:eshop/Models/product.dart';

class MVariation extends MProducts {
  String? color;
  int? productId;

  MVariation({
    this.color,
    this.productId,
  });

  MVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    offerPrice = json['offer_price'];
    color = json['color'];
    productId = json['product_id'];
    images = json['images'].cast<String>();
  }
}
