import 'package:eshop/Models/product.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class ProductRepo {
  final api = AppApi();
  List<MProducts> _products = List<MProducts>.empty(growable: true);
  int _categoryId = 0;

  ProductRepo(int categoryId) {
    _categoryId = categoryId;
  }
  MProducts? _productDetails;

  set products(v) => _products = v;
  get products => _products;
  product(index) => _products[index];
  get productsCount => _products.length;

  set productDetail(v) => _productDetails = v;
  get productDetail => _productDetails;
  

  set categoryId(v) => _categoryId = v;
  get categoryId => _categoryId;

  getAllProducts() async {
    final ApiResponse response =
        await api.allProductsByCategory(id: _categoryId);
    return response;
  }

  getProductDetail(id) async {
    final ApiResponse response = await api.productDetail(id);
    return response;
  }
}
