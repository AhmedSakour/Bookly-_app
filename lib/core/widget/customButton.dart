import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.color,
      required this.onpress,
      required this.text,
      required this.sizeText,
      required this.borderRadius,
      required this.textColor})
      : super(key: key);
  final Color color;
  final BorderRadius borderRadius;
  final Color textColor;
  final String text;
  final double sizeText;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: borderRadius)),
          onPressed: onpress,
          child: Text(
            text,
            style: Styles.textStyle18
                .copyWith(color: textColor, fontSize: sizeText),
          )),
    );
  }
}
