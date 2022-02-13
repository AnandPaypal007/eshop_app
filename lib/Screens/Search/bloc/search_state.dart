import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  SearchState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnSearchState extends SearchState {

  UnSearchState();

  @override
  String toString() => 'UnSearchState';
}

/// Initialized
class InSearchState extends SearchState {
  InSearchState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InSearchState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorSearchState extends SearchState {
  ErrorSearchState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorSearchState';

  @override
  List<Object> get props => [errorMessage];
}
