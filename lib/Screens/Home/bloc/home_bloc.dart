import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:eshop/Models/category.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo repo;

  HomeBloc(HomeState initialState, this.repo) : super(initialState) {
    on<HomeEvent>((event, emit) {
      return emit.forEach<HomeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'HomeBloc', error: error, stackTrace: stackTrace);
          return ErrorHomeState(error.toString());
        },
      );
    });
  }
}
