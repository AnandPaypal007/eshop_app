import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:eshop/Screens/Cart/bloc/cart_repo.dart';

import 'index.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;

  CartBloc(CartState initialState, this.repo) : super(initialState){
   on<CartEvent>((event, emit) {
      return emit.forEach<CartState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'CartBloc', error: error, stackTrace: stackTrace);
          return ErrorCartState(error.toString());
        },
      );
    });
  }
}
