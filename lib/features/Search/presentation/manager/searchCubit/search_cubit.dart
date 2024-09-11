import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/Search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchRepo,
  ) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBook(namebook) async {
    emit(SearchLoading());
    if (namebook == '') {
      emit(SearchNo());
    } else {
      var result = await searchRepo.fetchSearchBook(namebook);

      result.fold((failure) {
        emit(SearchFailure(failure.errorMessage));
      }, (books) {
        emit(SearchSuccess(books));
      });
    }
  }
}
