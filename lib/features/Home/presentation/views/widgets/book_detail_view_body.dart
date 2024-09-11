import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presentation/views/widgets/similarBookSection.dart';
import 'package:flutter/material.dart';
import 'bookSection.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              children: [
                BookDetailSection(bookModel: bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SimilarBookDetailSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
