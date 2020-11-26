import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/common/colors.dart';
import 'package:hiking_dude_mobile/common/text-styles.dart';

class ButtonRounded extends StatelessWidget {
  const ButtonRounded(
    this.text,
    this.onPressed, {
    this.backgroundColor = AppColors.pink,
    this.textColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 34.0),
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: false,
      child: Padding(
        padding: padding,
        child: Text(text, style: subtitleTS(color: textColor)),
      ),
      clipBehavior: Clip.none,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: backgroundColor)),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
