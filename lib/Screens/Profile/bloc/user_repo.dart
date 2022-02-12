import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class UserRepo {
  final api = AppApi();
  int _cartCount = 0;

  set cartCount(v) => _cartCount = v;
  get cartCount => _cartCount;

  fetchCart(isCount) async {
    ApiResponse response = await api.userCart(isCount);
    return response;
  }

  addCart(body) async {
    ApiResponse response = await api.addToCart(body);
    return response;
  }
}
