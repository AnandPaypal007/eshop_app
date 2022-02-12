import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class AuthenticationEvent {
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc});
}

class UnAuthenticationEvent extends AuthenticationEvent {
  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState? currentState, AuthenticationBloc? bloc}) async* {
    yield const AuthenticationDefaultState();
  }
}

class SigninEvent extends AuthenticationEvent {
  SigninEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState? currentState, AuthenticationBloc? bloc}) async* {
    try {
      yield const AuthenticationLoadingState();
      final ApiResponse response = await bloc?.repo.login();
      if (response.status == APIStatus.completed) {
         UserSession.shared.setToekn(response.data["token"]);
        yield const AuthenticationDoneState();
      } else {
        yield ErrorAuthenticationState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAuthenticationEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState(_.toString());
    }
  }
}
