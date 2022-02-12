import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:eshop/Screens/Products/bloc/product_repo.dart';

import 'index.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;

  ProductBloc(ProductState initialState, this.repo) : super(initialState){
   on<ProductEvent>((event, emit) {
      return emit.forEach<ProductState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'ProductBloc', error: error, stackTrace: stackTrace);
          return ErrorProductState(error.toString());
        },
      );
    });
  }
}
