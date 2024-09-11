import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
