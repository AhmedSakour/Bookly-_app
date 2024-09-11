import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/views/widgets/customAppBar_Homeview.dart';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assest.dart';
import 'FeaturedListView.dart';
import 'book_listview.dart';
import 'bestSeller_ltem.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              FeaturedListViewBook(),
              SizedBox(
                height: 49.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Newset Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BestSellerListView(),
        )),
      ],
    );
  }
}
