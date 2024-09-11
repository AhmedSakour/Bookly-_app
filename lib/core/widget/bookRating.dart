import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final int rating;
  final int count;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 20,
          color: Color(0xFFFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          count.toString(),
          style: Styles.textStyle14,
        )
      ],
    );
  }
}
