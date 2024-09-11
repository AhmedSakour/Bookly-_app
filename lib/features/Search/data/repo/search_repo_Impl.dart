import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/Search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_services.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBook(
      String nameBook) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$nameBook');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return Left(ServerFailure(e.toString()));
    }
  }
}
