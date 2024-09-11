import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/Functions/customLunchIUrl.dart';
import '../../../../../core/widget/customButton.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onpress: () {},
          sizeText: 17,
          text: 'Free',
          color: Colors.white,
          textColor: Colors.black,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        CustomButton(
          onpress: () {
            customLunchUrl(context, bookModel.volumeInfo?.previewLink);
          },
          sizeText: 15,
          text: getText(),
          color: const Color(0xFFEF8262),
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
      ],
    );
  }

  String getText() {
    if (bookModel.volumeInfo?.previewLink == null) {
      return 'unAvaliable';
    } else {
      return 'Preview';
    }
  }
}
