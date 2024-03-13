import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' hide FunDsTextField;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsCounter extends StatefulWidget {
  const FunDsCounter({
    super.key,
    this.enabled = true,
    required this.label,
    required this.onChanged,
    this.errorMessage,
    this.initialValue = 1,
    this.range = 1,
    this.min = 1,
    this.max = 999,
  });

  final bool enabled;
  final String? label;
  final Function(int) onChanged;
  final String? errorMessage;
  final int initialValue;
  final int min;
  final int max;
  final int range;

  @override
  State<FunDsCounter> createState() => _FunDsCounterState();
}

class _FunDsCounterState extends State<FunDsCounter> {
  late int value;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue.toString();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            key: const Key('counterLabel'),
            style: FunDsTypography.body12.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        SizedBox(
          height: 4.h,
        ),
        IntrinsicWidth(
          child: TextField(
            key: const Key('counterTextField'),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            enabled: widget.enabled,
            controller: controller,
            style: FunDsTypography.body12.copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxLength: 3,
            onTapOutside: (pointer) {
              setState(
                () {
                  if (controller.text.isNotEmpty) {
                    if ((int.tryParse(controller.text) ?? 0) < widget.min) {
                      controller.text = widget.min.toString();
                      value = widget.min;
                    } else if ((int.tryParse(controller.text) ?? 0) >
                        widget.max) {
                      controller.text = widget.max.toString();
                      value = widget.max;
                    }
                    value = int.parse(controller.text);
                  } else {
                    controller.text = value.toString();
                  }
                },
              );
              widget.onChanged(
                value,
              );
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
                borderSide: const BorderSide(
                  color: FunDsColors.colorPrimary,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
                borderSide: const BorderSide(
                  color: FunDsColors.colorNeutral200,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
                borderSide: const BorderSide(
                  color: FunDsColors.colorRed500,
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
                borderSide: const BorderSide(
                  color: FunDsColors.colorRed500,
                  width: 2,
                ),
              ),
              errorStyle: FunDsTypography.body12.copyWith(
                fontWeight: FontWeight.w400,
              ),
              filled: !widget.enabled,
              fillColor: FunDsColors.colorNeutral50,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: const BorderSide(
                  color: FunDsColors.colorNeutral200,
                  width: 2,
                ),
              ),
              counterText: '',
              errorText: widget.errorMessage,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(
                  4,
                ).copyWith(
                  right: 20,
                ),
                child: IconButton(
                  key: const Key('counterMinusButton'),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    fixedSize: Size(
                      20.r,
                      20.r,
                    ),
                    disabledBackgroundColor: FunDsColors.colorNeutral400,
                    backgroundColor: FunDsColors.colorPrimary,
                  ),
                  onPressed: widget.enabled && value > widget.min
                      ? () {
                          setState(() {
                            value -= widget.range;
                            controller.text = value.toString();
                          });

                          widget.onChanged(value);
                        }
                      : null,
                  icon: const Icon(
                    Icons.remove_rounded,
                    color: FunDsColors.colorWhite,
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(
                  4,
                ).copyWith(
                  left: 20,
                ),
                child: IconButton(
                  key: const Key('counterAddButton'),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    fixedSize: Size(
                      20.r,
                      20.r,
                    ),
                    disabledBackgroundColor: FunDsColors.colorNeutral400,
                    backgroundColor: FunDsColors.colorPrimary,
                  ),
                  onPressed: widget.enabled && value < widget.max
                      ? () {
                          setState(() {
                            value += widget.range;
                            controller.text = value.toString();
                          });
                          widget.onChanged(value);
                        }
                      : null,
                  icon: const Icon(
                    Icons.add_rounded,
                    color: FunDsColors.colorWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
