import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/app_rout.dart';
import 'package:bookly/core/utils/assest.dart';
import 'package:bookly/features/Home/presentation/views/home_view.dart';
import 'package:bookly/features/Splash/presentation/views/widgets/slidingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SlashViewBody extends StatefulWidget {
  const SlashViewBody({Key? key}) : super(key: key);

  @override
  State<SlashViewBody> createState() => _SlashViewBodyState();
}

class _SlashViewBodyState extends State<SlashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    initAnimation();
    goToHome();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  void goToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        try {
          GoRouter.of(context).go(AppRoute.kHomeRoute);
        } on Exception catch (e) {
          print(e);
          // TODO
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              AssestData.logo,
              width: 70,
              height: 70,
            ),
            const SizedBox(
              height: 5,
            ),
            SlidingTextAnimation(slideAnimation: slideAnimation)
          ],
        ),
      ),
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slideAnimation = Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
