import 'package:bloc/bloc.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) {
      emit(FeaturedBookFailure(failure.errorMessage));
      // return left(
      //       ServerFailure.fromDioError(DioException.connectionTimeout(error: failure,requestOptions: )),
      //     );
    }, (books) {
      emit(FeaturedBookSuccess(books));
    });
  }
}
