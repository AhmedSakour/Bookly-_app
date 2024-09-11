import 'package:bookly/core/utils/app_rout.dart';
import 'package:bookly/core/utils/custom_CircleProgrees.dart';
import 'package:bookly/features/Home/presentation/manger/FeaturedBooks_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/custom_error_widget.dart';
import '../../../../../core/widget/custom_BookImage_item.dart';

class FeaturedListViewBook extends StatelessWidget {
  const FeaturedListViewBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.bookModel.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoute.kBookDetail,
                        extra: state.bookModel[index]);
                  },
                  child: CustomBookImageItem(
                    imgUrl:
                        state.bookModel[index].volumeInfo!.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(
            errorMessage: state.message,
          );
        } else {
          return const Center(child: CustomCircleProgress());
        }
      },
      listener: (context, state) {
        if (state is FeaturedBookFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
    );
  }
}
