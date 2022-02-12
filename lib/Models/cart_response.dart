import 'cart.dart';

class MCartResponse {
  List<MCart>? items;

  MCartResponse({this.items});

  MCartResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <MCart>[];
      json['items'].forEach((v) {
        items!.add(MCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
