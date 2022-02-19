class MOfferResponse {
  List<MOffers>? offers;

  MOfferResponse({this.offers});

  MOfferResponse.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <MOffers>[];
      json['offers'].forEach((v) {
        offers!.add(MOffers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MOffers {
  String? name;
  String? logo;
  int? id;
  String? description;

  MOffers({this.name, this.logo, this.id, this.description,});

  MOffers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['logo'] = logo;
    data['id'] = id;
    data['description'] = description;
    return data;
  }
}

