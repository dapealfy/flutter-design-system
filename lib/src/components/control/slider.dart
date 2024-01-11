import 'package:flutter/material.dart' hide Slider;
import 'package:flutter/material.dart' as m;
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SliderType {
  slider,
  rangeSlider,
}

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
    required this.type,
    this.value,
    this.onChanged,
    this.label,
    this.rangeValue,
    this.onRangeChanged,
    this.rangeLabels,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.enabled = true,
  })  : assert(
          (type == SliderType.slider && value != null) ||
              (type == SliderType.rangeSlider && rangeValue != null),
        ),
        super(key: key);

  factory Slider.slider({
    Key? key,
    required double value,
    required Function(double value) onChanged,
    required double min,
    required double max,
    String? label,
    int? divisions,
    bool enabled = true,
  }) {
    return Slider(
      key: key,
      type: SliderType.slider,
      value: value,
      label: label,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      enabled: enabled,
    );
  }

  factory Slider.rangeSlider({
    Key? key,
    required RangeValues value,
    required Function(RangeValues value) onChanged,
    required double min,
    required double max,
    RangeLabels? labels,
    int? divisions,
    bool enabled = true,
  }) {
    return Slider(
      key: key,
      type: SliderType.rangeSlider,
      rangeValue: value,
      rangeLabels: labels,
      onRangeChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      enabled: enabled,
    );
  }

  /// The type of slider to display.
  final SliderType type;

  /// The currently selected values if type is [SliderType.rangeSlider].
  final RangeValues? rangeValue;

  /// The labels to show for the min and max values.
  /// if type is [SliderType.rangeSlider].
  /// And division is not null.
  final RangeLabels? rangeLabels;

  /// Called when the user starts selecting a new value for the slider
  /// if type is [SliderType.rangeSlider].
  final Function(RangeValues)? onRangeChanged;

  /// The currently selected value if type is [SliderType.slider].
  final double? value;

  /// The label to show for the currently selected value.
  /// if type is [SliderType.slider].
  /// And division is not null.
  final String? label;

  /// Called when the user starts selecting a new value for the slider
  /// if type is [SliderType.slider].
  final Function(double)? onChanged;

  /// The minimum value the user can select.
  final double min;

  /// The maximum value the user can select.
  final double max;

  /// The number of discrete divisions.
  final int? divisions;

  /// Whether the slider is enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        sliderTheme: SliderThemeData(
          thumbColor: FunDsColors.colorPrimary,
          activeTrackColor: FunDsColors.colorPrimary,
          inactiveTrackColor: FunDsColors.colorNeutral200,
          disabledThumbColor: FunDsColors.colorNeutral400,
          disabledActiveTrackColor: FunDsColors.colorNeutral400,
          disabledInactiveTrackColor: FunDsColors.colorNeutral200,
          inactiveTickMarkColor: FunDsColors.colorPrimary,
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: FunDsColors.colorPrimary,
          rangeValueIndicatorShape:
              const PaddleRangeSliderValueIndicatorShape(),
          valueIndicatorTextStyle:
              FunDsTypography.body12.copyWith(color: FunDsColors.colorWhite),
          overlayColor: FunDsColors.colorPrimary.withOpacity(0.12),
          trackHeight: 6.h,
          thumbShape: _FunDsSliderThumbShape(
            outerColor: FunDsColors.colorWhite,
            thumbRadius: 10.r,
            outerRadius: 12.r,
          ),
          rangeThumbShape: _FunDsRangeSliderThumbShape(
            outerColor: FunDsColors.colorWhite,
            thumbRadius: 10.r,
            outerRadius: 12.r,
          ),
        ),
      ),
      child: type == SliderType.slider
          ? m.Slider(
              key: const Key('sliderKey'),
              value: value!,
              min: min,
              max: max,
              label: label,
              divisions: divisions,
              onChanged: enabled
                  ? (value) {
                      onChanged?.call(value);
                    }
                  : null,
            )
          : m.RangeSlider(
              key: const Key('rangeSliderKey'),
              values: m.RangeValues(rangeValue!.start, rangeValue!.end),
              min: min,
              max: max,
              divisions: divisions,
              labels: rangeLabels,
              onChanged: enabled
                  ? (value) {
                      onRangeChanged?.call(RangeValues(value.start, value.end));
                    }
                  : null,
            ),
    );
  }
}

class _FunDsSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color outerColor;
  final double outerRadius;

  const _FunDsSliderThumbShape({
    this.thumbRadius = 12,
    this.outerColor = Colors.white,
    this.outerRadius = 16,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(outerRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;

    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;

    canvas.drawCircle(
      center,
      outerRadius,
      Paint()..color = outerColor,
    );

    canvas.drawCircle(
      center,
      thumbRadius,
      Paint()..color = color,
    );
  }
}

class _FunDsRangeSliderThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;
  final Color outerColor;
  final double outerRadius;

  const _FunDsRangeSliderThumbShape({
    required this.thumbRadius,
    required this.outerColor,
    required this.outerRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(outerRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;

    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;

    canvas.drawCircle(
      center,
      outerRadius,
      Paint()..color = outerColor,
    );

    canvas.drawCircle(
      center,
      thumbRadius,
      Paint()..color = color,
    );
  }
}
