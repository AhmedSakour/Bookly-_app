import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Search/presentation/views/widgets/searchTextField.dart';
import 'package:bookly/features/Search/presentation/views/widgets/similarBookListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Serach Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SimilarBookListview())
        ],
      ),
    );
  }
}
