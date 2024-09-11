import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'bestSeller_ltem.dart';
import 'bookAction.dart';
import '../../../../../core/widget/bookRating.dart';
import 'customAppBar_BookDetail.dart';
import '../../../../../core/widget/custom_BookImage_item.dart';

class BookDetailSection extends StatelessWidget {
  const BookDetailSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomAppBarBookDetail(),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImageItem(
            imgUrl: bookModel.volumeInfo!.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle20.copyWith(fontSize: 25),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          count: bookModel.volumeInfo!.ratingsCount ?? 0,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 25,
        ),
        BookAction(bookModel: bookModel),
      ],
    );
  }
}
