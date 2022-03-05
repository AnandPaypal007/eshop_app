import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Models/cart_response.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class CartEvent {
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc});
}

class UnCartEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    yield CartDefaultState();
  }
}

class LoadCartEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
      yield CartLoadingState();
      final ApiResponse response = await bloc?.repo.fetchCart();
      if (response.status == APIStatus.completed) {
        final MCartResponse res = MCartResponse.fromJson(response.data);
        bloc?.repo.product = res.items;
      } else {
        yield ErrorCartState(response.message);
      }
      yield CartFetchingDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

class UpdateCartQuantityEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
      yield CartLoadingState();
      final body = {
        'cart_id': bloc?.repo.currentItem?.id,
        "quantity": bloc?.repo.currentItem?.quantity
      };

      final ApiResponse response = await bloc?.repo.updateCartQuantity(body);
      if (response.status == APIStatus.completed) {
        yield CartQuantityUpdatedState();
      } else {
        yield ErrorCartState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

class DeleteCartItemEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
      yield CartLoadingState();
      final ApiResponse response =
          await bloc?.repo.deleteCartItem(bloc.repo.currentItem?.id);
      if (response.status == APIStatus.completed) {
        yield CartItemDeletedState();
      } else {
        yield ErrorCartState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

class ReloadCartEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
      yield CartLoadingState();
      yield CartFetchingDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

class CreateInvoiceEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
       final ApiResponse response =
          await bloc?.repo.createInvoice();
      if (response.status == APIStatus.completed) {
        yield InvoiceCreatedState();
      } else {
        yield ErrorCartState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

class MakePaymentEvent extends CartEvent {
  final int invoiceId;
  MakePaymentEvent({this.invoiceId = 0});
  @override
  Stream<CartState> applyAsync(
      {CartState? currentState, CartBloc? bloc}) async* {
    try {
       final ApiResponse response =
          await bloc?.repo.makePayment(invoiceId);
      if (response.status == APIStatus.completed) {
        yield PaymentSuccessState();
      } else {
        yield PaymentErrorState();
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(_.toString());
    }
  }
}

