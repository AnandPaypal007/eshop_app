import 'package:eshop/Models/cart.dart';
import 'package:eshop/Services/app_api.dart';

class CartRepo {
  AppApi api = AppApi();

  final List<MCart> _products = List<MCart>.empty(growable: true);
  MCart? _currentItem;

  set product(v) => _products.addAll(v);
  get product => _products;
  get count => _products.length;

  set currentItem(v) => _currentItem = v;
  MCart? get currentItem => _currentItem;

  cartTotal() {
    num total = 0.0;
    num tax = 0.0;
    for (var product in _products) {
      if (product.offerPrice != null && product.quantity != null) {
        total = total + (product.quantity! * product.offerPrice!);
      }
    }
    total = tax + total;
    return total;
  }

  makeInvoiceData() {
    num total = cartTotal();
    final products = _products.map((e) => {"product_id": e.id}).toList();
    final data = {"total": total, "tax": 0.0, "products": products};
    return data;
  }

  fetchCart() async {
    return await api.getCart();
  }

  

  updateCartQuantity(body) async {
    return await api.updateCartQuantity(body);
  }

  deleteCartItem(catId) async {
    return await api.deleteCartItem(catId);
  }

  createInvoice() async {
    final data = makeInvoiceData();
    return await api.createInvoice(data);
  }

  makePayment(invoiceId) async {
    return await api.makePayment(invoiceId);
  }

  removeItemFromLocal(id) {
    _products.removeWhere((element) => element.id == id);
  }
}
