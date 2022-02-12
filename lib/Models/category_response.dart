import 'package:eshop/Models/category.dart';

class MCategoryResponse {
  List<MCategory>? categories;

  MCategoryResponse({this.categories});

  MCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <MCategory>[];
      json['categories'].forEach((v) {
        categories!.add(new MCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

