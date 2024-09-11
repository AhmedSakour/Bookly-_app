import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/app_rout.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/Home/presentation/manger/FeaturedBooks_cubit/featured_book_cubit.dart';
import 'package:bookly/features/Home/presentation/manger/newestCubit/newest_books_cubit.dart';
import 'package:bookly/features/Search/presentation/manager/searchCubit/search_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/Search/data/repo/search_repo_Impl.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewsetBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
        ),
      ),
    );
  }
}
