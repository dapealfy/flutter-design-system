import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsProgressBar extends StatelessWidget {
  final FunDsProgressBarSize size;
  final FunDsProgressBarColor color;
  final double value; // value 1-100

  const FunDsProgressBar(
      {super.key,
      required this.size,
      required this.color,
      required this.value,
      required});

  static Widget alternate({
    Key? key,
    required FunDsProgressBarSize size,
    required FunDsProgressBarColor color,
    required double value,
  }) {
    return FunDsProgressBar(
      size: size,
      color: color,
      value: value,
    )._progressBar(FunDsColors.colorWhite);
  }

  @override
  Widget build(BuildContext context) {
    return _progressBar(FunDsColors.colorNeutral200);
  }

  Widget _progressBar(Color bgColor) {
    return SizedBox(
    key: key,
      width: 320.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: LinearProgressIndicator(
          value: value/100,
          backgroundColor: bgColor,
          minHeight: _getHeight(),
          valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
          borderRadius: BorderRadius.all(Radius.circular(_getHeight() / 2)),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case FunDsProgressBarSize.small:
        return 4.h;
      case FunDsProgressBarSize.medium:
        return 6.h;
      case FunDsProgressBarSize.large:
        return 8.h;
    }
  }

  Color _getColor() {
    switch (color) {
      case FunDsProgressBarColor.grey:
        return FunDsColors.colorNeutral500;
      case FunDsProgressBarColor.purple:
        return FunDsColors.colorPrimary;
      case FunDsProgressBarColor.green:
        return FunDsColors.colorGreen500;
      case FunDsProgressBarColor.yellow:
        return FunDsColors.colorYellow500;
      case FunDsProgressBarColor.orange:
        return FunDsColors.colorOrange500;
      case FunDsProgressBarColor.red:
        return FunDsColors.colorRed500;
    }
  }
}

enum FunDsProgressBarSize { small, medium, large }

enum FunDsProgressBarColor { grey, purple, green, yellow, orange, red }
