import 'dart:async';
import 'dart:developer' as developer;
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class SearchEvent {
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc});
}

class UnSearchEvent extends SearchEvent {
  @override
  Stream<SearchState> applyAsync({SearchState? currentState, SearchBloc? bloc}) async* {
    yield UnSearchState();
  }
}

class LoadSearchEvent extends SearchEvent {
   
  @override
  Stream<SearchState> applyAsync(
      {SearchState? currentState, SearchBloc? bloc}) async* {
    try {
      yield UnSearchState();
      await Future.delayed(const Duration(seconds: 1));
      yield InSearchState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSearchEvent', error: _, stackTrace: stackTrace);
      yield ErrorSearchState( _.toString());
    }
  }
}
