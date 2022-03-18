import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Models/offer_response.dart';
import 'package:eshop/Models/order_response.dart';
import 'package:eshop/Models/user_profile.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:eshop/Utils/user_session.dart';
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
      if (UserSession.shared.token == "" || UserSession.shared.token == null) {
        yield CartFetchingDoneState();
      }
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
      ApiResponse response = await bloc?.repo.addCart(body);
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

class LoadOrdersEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync(
      {UserState? currentState, UserBloc? bloc}) async* {
    try {
      yield UserLoadingState();
      ApiResponse response = await bloc?.repo.fetchOrders();
      if (response.status == APIStatus.completed) {
        MOrderResponse ordersResponse = MOrderResponse.fromJson(response.data);
        bloc?.repo.orders = ordersResponse.orders;
        yield OrdersFetchingDoneState();
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

class UserDetailEvent extends UserEvent {
  @override
  Stream<UserState> applyAsync(
      {UserState? currentState, UserBloc? bloc}) async* {
    try {
      yield UserLoadingState();
      ApiResponse response = await bloc?.repo.userDetails();
      if (response.status == APIStatus.completed) {
        MUserProfile profile = MUserProfile.fromJson(response.data);
        bloc?.repo.profile = profile;
        yield ProfileFetchingDoneState();
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
