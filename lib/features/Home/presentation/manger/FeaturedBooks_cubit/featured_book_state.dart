part of 'featured_book_cubit.dart';

abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> bookModel;

  FeaturedBookSuccess(this.bookModel);
}

class FeaturedBookFailure extends FeaturedBookState {
  final String message;

  FeaturedBookFailure(this.message);
}
