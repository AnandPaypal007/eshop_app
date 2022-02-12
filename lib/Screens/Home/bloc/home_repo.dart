import 'package:eshop/Models/category.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Services/app_api.dart';

class HomeRepo {
  final api = AppApi();
  final List<MCategory> categories = List<MCategory>.empty(growable: true);

  set categories(v) => categories = v;

  getAllCategories() async {
    final ApiResponse response = await api.allCategories();
    return response;
  }
}
