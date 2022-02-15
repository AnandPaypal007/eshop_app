import 'dart:async';
import 'dart:developer' as developer;
import 'package:eshop/Models/product_response.dart';
import 'package:eshop/Services/api_response.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class SearchEvent {
  Stream<SearchState> applyAsync({SearchState currentState, SearchBloc bloc});
}

class UnSearchEvent extends SearchEvent {
  @override
  Stream<SearchState> applyAsync(
      {SearchState? currentState, SearchBloc? bloc}) async* {
    yield SearchDefaultState();
  }
}

class LoadSearchEvent extends SearchEvent {
  final String? text;

  LoadSearchEvent({this.text});

  @override
  Stream<SearchState> applyAsync(
      {SearchState? currentState, SearchBloc? bloc}) async* {
    try {
      yield SearchLoadingState();
      ApiResponse response = await bloc?.repo.search(text);
      if (response.status == APIStatus.completed) {
        final res = MProductResponse.fromJson(response.data);
        if (res.products!.isEmpty) {
          bloc?.repo.products = [];
        } else {
          bloc?.repo.products = res.products;
        }
        yield SearchDoneState();
      } else {
        yield ErrorSearchState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSearchEvent', error: _, stackTrace: stackTrace);
      yield ErrorSearchState(_.toString());
    }
  }
}
