import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Models/category_response.dart';
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
