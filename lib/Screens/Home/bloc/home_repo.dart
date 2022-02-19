import 'package:eshop/Models/category.dart';
import 'package:eshop/Models/offer_response.dart';
import 'package:eshop/Models/product.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class HomeRepo {
  final api = AppApi();
  final List<MCategory> categories = List<MCategory>.empty(growable: true);
  final List<MOffers> offers = List<MOffers>.empty(growable: true);
  final List<MProducts> products = List<MProducts>.empty(growable: true);

  set categories(v) => categories = v;
  set offers(v) => offers = v;
  set products(v) => products = v;

  getAllCategories() async {
    final ApiResponse response = await api.allCategories();
    return response;
  }

  getOffers() async {
    final ApiResponse response = await api.getOffers();
    return response;
  }

  getOffersDetails(id) async {
    final ApiResponse response = await api.getOffersDetails(id);
    return response;
  }

  loadDeals(type) async {
    final ApiResponse response = await api.getDeals(type);
    return response;
  }
}
