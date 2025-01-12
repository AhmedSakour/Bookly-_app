import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimailrBook({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccses(books));
    });
  }
}
