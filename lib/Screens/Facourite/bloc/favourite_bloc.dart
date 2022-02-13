import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';

import 'favourite_repo.dart';
import 'index.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepo repo;
  

  FavouriteBloc(FavouriteState initialState, this.repo) : super(initialState){
   on<FavouriteEvent>((event, emit) {
      return emit.forEach<FavouriteState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'FavouriteBloc', error: error, stackTrace: stackTrace);
          return ErrorFavouriteState(error.toString());
        },
      );
    });
  }
}
