import 'dart:async';
import 'dart:developer' as developer;

import 'package:eshop/Models/product_response.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class FavouriteEvent {
  Stream<FavouriteState> applyAsync(
      {FavouriteState currentState, FavouriteBloc bloc});
}

class UnFavouriteEvent extends FavouriteEvent {
  @override
  Stream<FavouriteState> applyAsync(
      {FavouriteState? currentState, FavouriteBloc? bloc}) async* {
    yield FavouriteDefaultState();
  }
}

class LoadFavouriteEvent extends FavouriteEvent {
  @override
  Stream<FavouriteState> applyAsync(
      {FavouriteState? currentState, FavouriteBloc? bloc}) async* {
    try {
      yield FavouriteLooadingState();
      ApiResponse response = await bloc?.repo.getFavourite();
      if (response.status == APIStatus.completed) {
        final MProductResponse res = MProductResponse.fromJson(response.data);
        bloc?.repo.products = res.favourites;
        yield FavouriteDoneState();
      } else {
        yield ErrorFavouriteState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFavouriteEvent', error: _, stackTrace: stackTrace);
      yield ErrorFavouriteState(_.toString());
    }
  }
}

class MakeFavouriteEvent extends FavouriteEvent {
  @override
  Stream<FavouriteState> applyAsync(
      {FavouriteState? currentState, FavouriteBloc? bloc}) async* {
    try {
      yield FavouriteLooadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield FavouriteDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFavouriteEvent', error: _, stackTrace: stackTrace);
      yield ErrorFavouriteState(_.toString());
    }
  }
}

class DeleteFavouriteEvent extends FavouriteEvent {
  @override
  Stream<FavouriteState> applyAsync(
      {FavouriteState? currentState, FavouriteBloc? bloc}) async* {
    try {
      yield FavouriteLooadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield FavouriteDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFavouriteEvent', error: _, stackTrace: stackTrace);
      yield ErrorFavouriteState(_.toString());
    }
  }
}
