import 'package:eshop/Models/product.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class SearchRepo {
  AppApi api = AppApi();

  List<MProducts> _products = List<MProducts>.empty(growable: true);

  set products(v) => _products = v;
  productFor(int index) => _products[index];
  get favouriteCount => _products.length;

  search(text) async {
    ApiResponse response = await api.searchFor(text);
    return response;
  }
}
