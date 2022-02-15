import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  SearchState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class SearchDefaultState extends SearchState {
  SearchDefaultState();

  @override
  String toString() => 'SearchDefaultState';
}

class SearchLoadingState extends SearchState {
  SearchLoadingState();

  @override
  String toString() => 'SearchLoadingState';
}

class SearchDoneState extends SearchState {
  SearchDoneState();

  @override
  String toString() => 'SearchDoneState';

  @override
  List<Object> get props => [];
}

class ErrorSearchState extends SearchState {
  ErrorSearchState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorSearchState';

  @override
  List<Object> get props => [errorMessage];
}
