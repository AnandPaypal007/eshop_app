import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Models/category_response.dart';
import 'package:eshop/Models/offer_response.dart';
import 'package:eshop/Models/offers_detail_response.dart';
import 'package:eshop/Models/product_response.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnHomeEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    yield HomeDefaultState();
  }
}

class LoadAllCategoriesEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield HomeLoadingState();
      final ApiResponse response = await bloc?.repo.getAllCategories();
      if (response.status == APIStatus.completed) {
        final categoryResponse = MCategoryResponse.fromJson(response.data);
        bloc?.repo.categories.addAll(categoryResponse.categories!);
        yield CategoryDoneState();
      } else {
        yield ErrorHomeState(response.message);
      }
      yield CategoryDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }
}

class LoadOffersEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield HomeLoadingState();
      final ApiResponse response = await bloc?.repo.getOffers();
      if (response.status == APIStatus.completed) {
        final categoryResponse = MOfferResponse.fromJson(response.data);
        bloc?.repo.offers.addAll(categoryResponse.offers!);
        yield OffersDoneState();
      } else {
        yield ErrorHomeState(response.message);
      }
      yield CategoryDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }
}

class LoadOffersDetailsEvent extends HomeEvent {
  final int? id;
  LoadOffersDetailsEvent({this.id});
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield HomeLoadingState();
      final ApiResponse response = await bloc?.repo.getOffersDetails(id);
      if (response.status == APIStatus.completed) {
        final MProductResponse categoryResponse =
            MProductResponse.fromJson(response.data);
        bloc?.repo.products.addAll(categoryResponse.products != null
            ? categoryResponse.products!
            : []);
        yield OffersDoneState();
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }
}

class LoadDealsEvent extends HomeEvent {
  final String? type;
  LoadDealsEvent({this.type = ""});
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield HomeLoadingState();
      final ApiResponse response = await bloc?.repo.loadDeals(type);
      if (response.status == APIStatus.completed) {
        final MProductResponse categoryResponse =
            MProductResponse.fromJson(response.data);
        bloc?.repo.products.addAll(categoryResponse.products != null
            ? categoryResponse.products!
            : []);
        yield OffersDoneState();
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }
}
