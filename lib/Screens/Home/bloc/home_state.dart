import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  HomeState();

  @override
  List<Object> get props => [];
}

class HomeDefaultState extends HomeState {
  HomeDefaultState();

  @override
  String toString() => 'HomeDefaultState';
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
  
  @override
  String toString() => 'InHomeState';

  @override
  List<Object> get props => [];
}

class HomeDoneState extends HomeState {
  HomeDoneState();
  
  @override
  String toString() => 'HomeDoneState';

  @override
  List<Object> get props => [];
}

class CategoryDoneState extends HomeState {
  CategoryDoneState();
  
  @override
  String toString() => 'CategoryDoneState';

  @override
  List<Object> get props => [];
}

class ErrorHomeState extends HomeState {
  ErrorHomeState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorHomeState';

  @override
  List<Object> get props => [errorMessage];
}
