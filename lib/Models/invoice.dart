class MInvoice {
  num? total;
  num? tax;
  bool? paymentStatus;
  String? createdAt;
  int? userId;
  int? id;

  MInvoice(
      {this.total,
      this.tax,
      this.paymentStatus,
      this.createdAt,
      this.userId,
      this.id,
      });

  MInvoice.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    tax = json['tax'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['tax'] = tax;
    data['payment_status'] = paymentStatus;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    data['id'] = id;
    return data;
  }
}
