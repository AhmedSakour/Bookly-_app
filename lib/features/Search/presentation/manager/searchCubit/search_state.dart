part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchNo extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> bookModel;

  SearchSuccess(
    this.bookModel,
  );
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}
