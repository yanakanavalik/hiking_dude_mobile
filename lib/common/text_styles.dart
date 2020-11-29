// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'colors.dart';

TextStyle titleTS({
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuBold',
        fontSize: 24,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle subtitleTS({
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuBold',
        fontSize: 18,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle paragraphTS({
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuRegular',
        fontSize: 16,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle customBoldTS({
  double fontSize,
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuBold',
        fontSize: fontSize,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle customRegularTS({
  double fontSize,
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuRegular',
        fontSize: fontSize,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle customMediumTS({
  double fontSize,
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuMedium',
        fontSize: fontSize,
        height: height,
        fontWeight: weight,
        color: color);

TextStyle customLightTS({
  double fontSize,
  FontWeight weight,
  double height = 1,
  Color color = AppColors.darkGray,
}) =>
    TextStyle(
        fontFamily: 'UbuntuLight',
        fontSize: fontSize,
        height: height,
        fontWeight: weight,
        color: color);
