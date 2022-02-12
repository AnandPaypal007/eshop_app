import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  UserState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UserDeaultState extends UserState {
  UserDeaultState();

  @override
  String toString() => 'UserDeaultState';
}

class CartFetchingDoneState extends UserState {
  CartFetchingDoneState();

  @override
  String toString() => 'CartFetchingDoneState';
}

/// Initialized
class UserLoadingState extends UserState {
  UserLoadingState();

  @override
  String toString() => 'InUserState';

  @override
  List<Object> get props => [];
}

class ErrorUserState extends UserState {
  ErrorUserState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorUserState';

  @override
  List<Object> get props => [errorMessage];
}
