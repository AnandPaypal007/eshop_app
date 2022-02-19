import 'package:eshop/Constant/constant.dart';

import 'api_base.dart';
import 'api_response.dart';

class AppApi extends ApiBase {
  static final AppApi _shared = AppApi._internal();
  factory AppApi() {
    return _shared;
  }
  AppApi._internal();

  login(body) async {
    try {
      final url = AppUrls.login;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  signup(body) async {
    try {
      final url = AppUrls.signup;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  allCategories() async {
    try {
      final url = AppUrls.categories;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  allProductsByCategory({int? id}) async {
    try {
      String url = AppUrls.products;
      if (id != null) {
        url = url + "?category_id=$id";
      }
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  userCart(isCount) async {
    try {
      String url = AppUrls.cartCount;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addToCart(body) async {
    try {
      String url = AppUrls.cart;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getCart() async {
    try {
      String url = AppUrls.cart;

      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateCartQuantity(body) async {
    try {
      String url = AppUrls.cart;

      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.put(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCartItem(cartId) async {
    try {
      String url = AppUrls.cart + "?cart_id=$cartId";

      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllFavourite() async {
    try {
      String url = AppUrls.favourite;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  makeFavourite(body) async {
    try {
      String url = AppUrls.favourite;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteFavourite() async {
    try {
      String url = AppUrls.favourite;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  searchFor(String text) async {
    try {
      String url = AppUrls.search + "?query_text=$text";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getOffers() async {
    try {
      String url = AppUrls.offers;
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getOffersDetails(id) async {
    try {
      String url = AppUrls.offersDetail + "?id=$id";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getDeals(type) async {
    try {
      String url = AppUrls.deals +"?type=$type";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
