import 'package:bookly/core/utils/custom_CircleProgrees.dart';
import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/Home/presentation/manger/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/custom_BookImage_item.dart';

class SimilarBooklistView extends StatelessWidget {
  const SimilarBooklistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccses) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.bookModel.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemBuilder: (context, index) {
                return CustomBookImageItem(
                  imgUrl:
                      state.bookModel[index].volumeInfo!.imageLinks.thumbnail,
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        }
        {
          return const CustomCircleProgress();
        }
      },
      listener: (context, state) {
        if (state is SimilarBooksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
    );
  }
}
