import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  CartState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class CartDefaultState extends CartState {
  CartDefaultState();

  @override
  String toString() => 'CartDefaultState';
}

/// Initialized
class CartLoadingState extends CartState {
  CartLoadingState();

  @override
  String toString() => 'CartLoadingState';

  @override
  List<Object> get props => [];
}

class CartFetchingDoneState extends CartState {
  CartFetchingDoneState();

  @override
  String toString() => 'CartFetchingDoneState';

  @override
  List<Object> get props => [];
}

class CartQuantityUpdatedState extends CartState {
  CartQuantityUpdatedState();

  @override
  String toString() => 'CartQuantityUpdatedState';

  @override
  List<Object> get props => [];
}

class CartItemDeletedState extends CartState {
  @override
  String toString() => 'CartItemDeletedState';

  @override
  List<Object> get props => [];
}

class ErrorCartState extends CartState {
  ErrorCartState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorCartState';

  @override
  List<Object> get props => [errorMessage];
}
