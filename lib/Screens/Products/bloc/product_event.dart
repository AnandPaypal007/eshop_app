import 'dart:async';
import 'dart:developer' as developer;

import 'package:eshop/Models/product_response.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class ProductEvent {
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc});
}

class UnProductEvent extends ProductEvent {
  @override
  Stream<ProductState> applyAsync(
      {ProductState? currentState, ProductBloc? bloc}) async* {
    yield ProductDefaultState();
  }
}

class LoadProductsEvent extends ProductEvent {
  @override
  Stream<ProductState> applyAsync(
      {ProductState? currentState, ProductBloc? bloc}) async* {
    try {
      yield ProductLoadingState();
      ApiResponse response = await bloc?.repo.getAllProducts();
      if (response.status == APIStatus.completed) {
        final productResponse = MProductResponse.fromJson(response.data);
        bloc?.repo.products = productResponse.products;
        yield ProductDoneState();
      } else {
        yield ErrorProductState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductState(_.toString());
    }
  }
}
