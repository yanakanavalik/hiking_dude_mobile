// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../assets/icons/my_flutter_app_icons.dart';
import '../common/colors.dart';

class BackArrowButton extends StatelessWidget {
  BackArrowButton({this.color = AppColors.pink});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MyFlutterApp.arrowBack, color: color),
      onPressed: () => Navigator.pop(context),
    );
  }
}
