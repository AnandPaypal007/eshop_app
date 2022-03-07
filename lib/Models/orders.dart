import 'invoice.dart';

class MOrders {
  int? id;
  MInvoice? invoice;
  String? status;

  MOrders({this.id, this.invoice, this.status});

  MOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    invoice =
        json['invoice'] != null ?  MInvoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (invoice != null) {
      data['invoice'] = invoice!.toJson();
    }
    return data;
  }
}