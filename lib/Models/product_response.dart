import 'package:eshop/Models/product.dart';

class MProductResponse {
  List<MProducts>? products;

  MProductResponse({this.products});

  MProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <MProducts>[];
      json['products'].forEach((v) {
        products!.add(MProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
