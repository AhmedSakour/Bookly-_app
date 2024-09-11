part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccses extends SimilarBooksState {
  final List<BookModel> bookModel;

  SimilarBooksSuccses(this.bookModel);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String message;

  SimilarBooksFailure(this.message);
}
