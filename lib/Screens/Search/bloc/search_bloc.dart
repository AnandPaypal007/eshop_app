import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';

import 'index.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc(SearchState initialState) : super(initialState){
   on<SearchEvent>((event, emit) {
      return emit.forEach<SearchState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'SearchBloc', error: error, stackTrace: stackTrace);
          return ErrorSearchState(error.toString());
        },
      );
    });
  }
}
