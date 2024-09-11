import 'package:bookly/core/utils/app_rout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assest.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 46.6),
      child: Row(
        children: [
          SvgPicture.asset(
            AssestData.logo,
            width: 90,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoute.kBookSearch);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass))
        ],
      ),
    );
  }
}
