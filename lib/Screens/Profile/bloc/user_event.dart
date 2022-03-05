import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class UserEvent {
  Stream<UserState> applyAsync({UserState currentState, UserBloc bloc});
}

class UnUserEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync(
      {UserState? currentState, UserBloc? bloc}) async* {
    yield UserDeaultState();
  }
}

class LoadCartCountEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync(
      {UserState? currentState, UserBloc? bloc}) async* {
    try {
      yield UserLoadingState();
      ApiResponse response = await bloc?.repo.fetchCartCount();
      if (response.status == APIStatus.completed) {
        bloc?.repo.cartCount = response.data["count"];
        yield CartFetchingDoneState();
      } else {
        yield ErrorUserState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadUserEvent', error: _, stackTrace: stackTrace);
      yield ErrorUserState(_.toString());
    }
  }
}

class AddCartEvent extends UserEvent {
  final body;
  AddCartEvent({this.body});

  @override
  Stream<UserState> applyAsync(
      {UserState? currentState, UserBloc? bloc}) async* {
    try {
      yield UserLoadingState();
      ApiResponse response =
          await bloc?.repo.addCart(body);
      if (response.status == APIStatus.completed) {
        yield CartFetchingDoneState();
      } else {
        yield ErrorUserState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadUserEvent', error: _, stackTrace: stackTrace);
      yield ErrorUserState(_.toString());
    }
  }
}
