import 'package:equatable/equatable.dart';

abstract class FavouriteState extends Equatable {
  FavouriteState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class FavouriteDefaultState extends FavouriteState {

  FavouriteDefaultState();

  @override
  String toString() => 'FavouriteDefaultState';
}

class FavouriteLooadingState extends FavouriteState {

  FavouriteLooadingState();

  @override
  String toString() => 'FavouriteLooadingState';
}

class FavouriteDoneState extends FavouriteState {
  FavouriteDoneState();
  
  @override
  String toString() => 'InFavouriteState';

  @override
  List<Object> get props => [];
}

class ErrorFavouriteState extends FavouriteState {
  ErrorFavouriteState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorFavouriteState';

  @override
  List<Object> get props => [errorMessage];
}
