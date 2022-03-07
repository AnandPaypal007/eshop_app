import 'orders.dart';

class MOrderResponse {
  List<MOrders>? orders;

  MOrderResponse({this.orders});

  MOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <MOrders>[];
      json['orders'].forEach((v) {
        orders!.add(MOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



