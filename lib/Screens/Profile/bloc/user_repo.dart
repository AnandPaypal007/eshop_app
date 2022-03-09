import 'package:eshop/Models/orders.dart';
import 'package:eshop/Models/user_profile.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class UserRepo {
  final api = AppApi();
  int _cartCount = 0;
  List<MOrders>? _orders;
  MUserProfile? _profile;

  set cartCount(v) => _cartCount = v;
  get cartCount => _cartCount;

  fetchCartCount() async {
    ApiResponse response = await api.userCartCount();
    return response;
  }

  addCart(body) async {
    ApiResponse response = await api.addToCart(body);
    return response;
  }

  fetchOrders() async {
    ApiResponse response = await api.userOrders();
    return response;
  }

  set orders(v) => _orders = v;
  get orders => _orders;
  get ordersCount => _orders != null && _orders!.isEmpty ? 0 : _orders!.length;
  orderFor(int index) => _orders![index];

  likeProduct() async {
    ApiResponse response = await api.userOrders();
    return response;
  }

  set profile(v) => _profile = v;
  MUserProfile get profile => _profile!;

  userDetails() async {
    ApiResponse response = await api.userDetails();
    return response;
  }
}
