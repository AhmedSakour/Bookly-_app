import 'package:bookly/core/utils/app_rout.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/widget/custom_BookImage_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assest.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widget/bookRating.dart';

class BestSellerItem extends StatelessWidget {
  BestSellerItem({
    required this.bookModel,
    Key? key,
  }) : super(key: key);

  BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kBookDetail, extra: bookModel);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 100,
              child: CustomBookImageItem(
                  imgUrl: bookModel.volumeInfo!.imageLinks.thumbnail)),
          const SizedBox(
            width: 29.17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    bookModel.volumeInfo!.title!,
                    style: Styles.textStyle20,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  bookModel.volumeInfo!.authors![0],
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    const Text(
                      'Free',
                      style: Styles.textStyle18,
                    ),
                    const Spacer(),
                    BookRating(
                        count: bookModel.volumeInfo?.ratingsCount ?? 10,
                        rating: bookModel.volumeInfo?.averageRating ?? 1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
