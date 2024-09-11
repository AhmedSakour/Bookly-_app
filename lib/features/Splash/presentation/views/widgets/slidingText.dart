import 'package:flutter/material.dart';

class SlidingTextAnimation extends StatelessWidget {
  const SlidingTextAnimation({
    Key? key,
    required this.slideAnimation,
  }) : super(key: key);

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slideAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slideAnimation,
            child: const Text(
              'Read free books',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
