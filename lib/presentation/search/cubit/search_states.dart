part of 'search_cubit.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {}

class SearchRefreshUi extends SearchStates {}

class SearchError extends SearchStates {
  final String message;

  SearchError(this.message);
}
