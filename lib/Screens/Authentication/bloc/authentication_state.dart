import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationDefaultState extends AuthenticationState {
  const AuthenticationDefaultState();

  @override
  String toString() => 'AuthenticationDefaultState';
}

class AuthenticationLoadingState extends AuthenticationState {
  const AuthenticationLoadingState();

  @override
  String toString() => 'AuthenticationLoadingState';

  @override
  List<Object> get props => [];
}

class AuthenticationDoneState extends AuthenticationState {
  const AuthenticationDoneState();

  @override
  String toString() => 'AuthenticationDoneState';

  @override
  List<Object> get props => [];
}

class ErrorAuthenticationState extends AuthenticationState {
  const ErrorAuthenticationState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorAuthenticationState';

  @override
  List<Object> get props => [errorMessage];
}
