import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  ProductState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class ProductDefaultState extends ProductState {
  ProductDefaultState();

  @override
  String toString() => 'ProductDefaultState';
}

class ProductDoneState extends ProductState {
  ProductDoneState();

  @override
  String toString() => 'ProductDoneState';
}

/// Initialized
class ProductLoadingState extends ProductState {
  ProductLoadingState();

  @override
  String toString() => 'InProductState';

  @override
  List<Object> get props => [];
}

class ErrorProductState extends ProductState {
  ErrorProductState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorProductState';

  @override
  List<Object> get props => [errorMessage];
}
