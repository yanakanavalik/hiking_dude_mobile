import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/common/colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    this.pageTitle,
    this.pageTitleColor,
    this.backgroundColor = AppColors.white,
    this.actions,
  });

  final String pageTitle;
  final Color pageTitleColor;
  final Color backgroundColor;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [],
      ),
    );
  }
}
