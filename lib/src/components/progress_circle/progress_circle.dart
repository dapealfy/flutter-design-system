import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsProgressCircle extends StatelessWidget {
  final double progress;
  final FunDsProgressCircleSize size;
  final Color color;
  final FunDsProgressCircleVariant variant;
  final String? label;
  final bool useAnimation;
  const FunDsProgressCircle({
    super.key,
    required this.progress,
    required this.variant,
    this.label,
    this.useAnimation = true,
    this.size = FunDsProgressCircleSize.small,
    this.color = FunDsColors.colorPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: variant == FunDsProgressCircleVariant.half
              ? _getHeight()
              : _getWidth(
                  size,
                ).h,
          width: _getWidth(
            size,
          ).w,
          child: DashedCircularProgressBar.aspectRatio(
            key: const Key('progressCircle'),
            aspectRatio: 1,
            progress: progress,
            startAngle: variant == FunDsProgressCircleVariant.circle ? 0 : 275,
            sweepAngle:
                variant == FunDsProgressCircleVariant.circle ? 360 : 170,
            circleCenterAlignment: variant == FunDsProgressCircleVariant.circle
                ? Alignment.center
                : Alignment.bottomCenter,
            child: Padding(
              padding: _getPadding(size, variant),
              child: variant == FunDsProgressCircleVariant.circle
                  ? Center(child: _content())
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: _content(),
                    ),
            ),
            backgroundStrokeWidth: size.strokeWidth,
            foregroundStrokeWidth: size.strokeWidth,
            foregroundColor: color,
            backgroundColor: FunDsColors.colorNeutral200,
            animation: useAnimation,
          ),
        ),
        if ((size == FunDsProgressCircleSize.xs ||
                size == FunDsProgressCircleSize.tiny) &&
            label != null)
          Padding(
            padding: EdgeInsets.only(
              top: 2.h,
            ),
            child: _label(),
          ),
      ],
    );
  }

  Widget _label() {
    return Text(
      key: const Key('label'),
      label!,
      textAlign: TextAlign.center,
      style: _getLabelTextStyle(size),
    );
  }

  TextStyle _getLabelTextStyle(FunDsProgressCircleSize size) {
    switch (size) {
      case FunDsProgressCircleSize.tiny ||
            FunDsProgressCircleSize.small ||
            FunDsProgressCircleSize.medium:
        return FunDsTypography.body12.copyWith(
          color: FunDsColors.colorNeutral600,
        );
      case FunDsProgressCircleSize.large:
        return FunDsTypography.body16.copyWith(
          color: FunDsColors.colorNeutral600,
        );
      default:
        return FunDsTypography.body18.copyWith(
          color: FunDsColors.colorNeutral600,
        );
    }
  }

  Widget _content() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: variant == FunDsProgressCircleVariant.circle
            ? MainAxisAlignment.center
            : MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (size != FunDsProgressCircleSize.xs &&
              size != FunDsProgressCircleSize.tiny &&
              label != null)
            _label(),
          Text(
              '${progress.toInt()}${size != FunDsProgressCircleSize.tiny ? '%' : ''}',
              key: const Key('percentage'),
              style: _getPercentageTextStyle(size)),
        ],
      ),
    );
  }

  TextStyle _getPercentageTextStyle(FunDsProgressCircleSize size) {
    switch (size) {
      case FunDsProgressCircleSize.xs || FunDsProgressCircleSize.tiny:
        return FunDsTypography.body14B.copyWith(
          color: FunDsColors.colorNeutral900,
        );
      case FunDsProgressCircleSize.small:
        return FunDsTypography.heading24.copyWith(
          color: FunDsColors.colorNeutral900,
        );
      case FunDsProgressCircleSize.medium:
        return FunDsTypography.heading14.copyWith(
          fontSize: 30.sp,
          color: FunDsColors.colorNeutral900,
        );
      case FunDsProgressCircleSize.large:
        return FunDsTypography.heading14.copyWith(
          fontSize: 36.sp,
          color: FunDsColors.colorNeutral900,
        );
      default:
        return FunDsTypography.heading14.copyWith(
          color: FunDsColors.colorNeutral900,
          fontSize: 48.sp,
        );
    }
  }

  double _getWidth(FunDsProgressCircleSize size) {
    switch (size) {
      case FunDsProgressCircleSize.tiny:
        return 42;
      case FunDsProgressCircleSize.xs:
        return 64;
      case FunDsProgressCircleSize.small:
        return 160;
      case FunDsProgressCircleSize.medium:
        return 200;
      case FunDsProgressCircleSize.large:
        return 240;
      default:
        return 280;
    }
  }

  double _getHeight() {
    switch (size) {
      case FunDsProgressCircleSize.tiny:
        return 24;
      case FunDsProgressCircleSize.xs:
        return 36;
      case FunDsProgressCircleSize.small:
        return 88;
      case FunDsProgressCircleSize.medium:
        return 110;
      case FunDsProgressCircleSize.large:
        return 132;
      default:
        return 154;
    }
  }

  EdgeInsets _getPadding(
      FunDsProgressCircleSize size, FunDsProgressCircleVariant variant) {
    switch (size) {
      case FunDsProgressCircleSize.tiny:
        return variant == FunDsProgressCircleVariant.circle
            ? EdgeInsets.all(
                8.r,
              )
            : EdgeInsets.all(
                6.r,
              ).copyWith(
                bottom: 0,
              );
      case FunDsProgressCircleSize.xs:
        return variant == FunDsProgressCircleVariant.circle
            ? EdgeInsets.all(
                12.r,
              )
            : EdgeInsets.all(
                16.r,
              ).copyWith(
                bottom: 0,
              );
      case FunDsProgressCircleSize.small:
        return EdgeInsets.all(32.r).copyWith(
          bottom: variant == FunDsProgressCircleVariant.circle ? 32.r : 0,
        );
      case FunDsProgressCircleSize.medium:
        return variant == FunDsProgressCircleVariant.circle
            ? EdgeInsets.all(
                34.r,
              )
            : EdgeInsets.all(40.r).copyWith(
                bottom: 0,
              );
      case FunDsProgressCircleSize.large:
        return EdgeInsets.all(
          52.r,
        ).copyWith(
          bottom: variant == FunDsProgressCircleVariant.circle ? 52.r : 0,
        );
      default:
        return variant == FunDsProgressCircleVariant.circle
            ? EdgeInsets.all(
                68.r,
              )
            : EdgeInsets.all(54.r).copyWith(
                bottom: 0,
              );
    }
  }
}

enum FunDsProgressCircleVariant {
  circle,
  half,
}

enum FunDsProgressCircleSize {
  tiny(
    strokeWidth: 4,
  ),
  xs(
    strokeWidth: 6,
  ),
  small(
    strokeWidth: 16,
  ),
  medium(
    strokeWidth: 20,
  ),

  large(
    strokeWidth: 24,
  ),
  xl(
    strokeWidth: 28,
  );

  const FunDsProgressCircleSize({
    required this.strokeWidth,
  });

  final double strokeWidth;
}
