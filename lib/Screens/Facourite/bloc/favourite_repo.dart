import 'package:eshop/Models/product.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class FavouriteRepo {
  AppApi api = AppApi();
  int productId = 0;
  List<MProducts> _products = List<MProducts>.empty(growable: true);

  set products(v) => _products = v;
  productFor(int index) => _products[index];
  get favouriteCount => _products.length;

  getFavourite() async {
    ApiResponse response = await api.getAllFavourite();
    return response;
  }

  makeFavourite() async {
    ApiResponse response = await api.makeFavourite({"product_id":productId});
    return response;
  }

  deleteFavourite() async {
    ApiResponse response = await api.makeFavourite("");
    return response;
  }
}
