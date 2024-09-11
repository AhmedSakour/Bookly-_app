import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presentation/manger/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/book_detail_view.dart';
import 'package:bookly/features/Home/presentation/views/home_view.dart';
import 'package:bookly/features/Search/presentation/views/search_view.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Home/data/repo/home_repo_impl.dart';

abstract class AppRoute {
  static const kHomeRoute = '/home';
  static const kBookDetail = '/BookDetail';
  static const kBookSearch = '/BookSearch';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeRoute,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: kBookDetail,
      builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          )),
    ),
    GoRoute(
      path: kBookSearch,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
