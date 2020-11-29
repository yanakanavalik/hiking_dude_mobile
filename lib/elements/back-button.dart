import 'package:flutter/material.dart';

import 'package:hiking_dude_mobile/assets/icons/my_flutter_app_icons.dart';
import 'package:hiking_dude_mobile/common/colors.dart';

class BackArrowButton extends StatelessWidget {
  BackArrowButton({this.color = AppColors.pink});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MyFlutterApp.arrow_back, color: color),
      onPressed: () => Navigator.pop(context),
    );
  }
}
