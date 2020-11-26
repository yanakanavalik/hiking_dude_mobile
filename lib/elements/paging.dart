import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/common/colors.dart';
import 'package:hiking_dude_mobile/elements/circle-painter.dart';

class Paging extends StatelessWidget {
  Paging(this.currentPageIndex, this.listOfPagesIndexes,
      {this.circleSize = 20,
      this.activeColor = AppColors.pink,
      this.inactiveColor = AppColors.pinkLight});

  final int currentPageIndex;
  final List<int> listOfPagesIndexes;
  final double circleSize;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final indexesAmount = listOfPagesIndexes.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < indexesAmount; i++)
          _buildCircle(currentPageIndex == listOfPagesIndexes[i],
              i == indexesAmount - 1),
      ],
    );
  }

  Widget _buildCircle(bool isActive, bool isLast) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        width: circleSize,
        height: circleSize,
        child: CustomPaint(
            painter: CirclePainter(isActive ? activeColor : inactiveColor)),
      ),
      if (!isLast) const SizedBox(width: 14)
    ]);
  }
}
