import 'package:bookly/features/Home/presentation/views/widgets/similar_featuredlistView.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBookDetailSection extends StatelessWidget {
  const SimilarBookDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooklistView(),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
