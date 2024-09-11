import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/custom_CircleProgrees.dart';
import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/Search/presentation/manager/searchCubit/search_cubit.dart';
import 'package:bookly/features/Search/presentation/views/widgets/similarBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListview extends StatelessWidget {
  const SimilarBookListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: state.bookModel.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              return SimilarBook(bookModel: state.bookModel[index]);
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return const Center(child: CustomCircleProgress());
        } else {
          return Container();
        }
      },
    );
  }
}
