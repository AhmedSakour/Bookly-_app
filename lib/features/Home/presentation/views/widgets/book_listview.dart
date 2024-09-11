import 'package:bookly/core/utils/custom_CircleProgrees.dart';
import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/Home/presentation/manger/newestCubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bestSeller_ltem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.bookModel.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              return BestSellerItem(
                bookModel: state.bookModel[index],
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CustomCircleProgress());
        }
      },
      listener: (context, state) {
        if (state is NewestBooksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
    );
  }
}
