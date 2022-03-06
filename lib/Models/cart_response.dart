import 'cart.dart';

class MCartResponse {
  List<MCart>? items;
  int? id;

  MCartResponse({this.items, this.id});

  MCartResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    if (json['products'] != null) {
      items = <MCart>[];
      json['products'].forEach((v) {
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
