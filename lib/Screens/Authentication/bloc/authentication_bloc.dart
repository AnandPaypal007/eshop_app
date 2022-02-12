import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:eshop/Screens/Authentication/bloc/auth_repo.dart';
import 'package:eshop/Screens/Authentication/bloc/index.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepo repo;

  AuthenticationBloc(AuthenticationState initialState, this.repo) : super(initialState){
   on<AuthenticationEvent>((event, emit) {
      return emit.forEach<AuthenticationState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'AuthenticationBloc', error: error, stackTrace: stackTrace);
          return ErrorAuthenticationState(error.toString());
        },
      );
    });
  }
}
