import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/Search/data/repo/search_repo_Impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt<ApiServices>()));
}
