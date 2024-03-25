import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/datepicker/calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsDatePickerSheet extends StatefulWidget {
  const FunDsDatePickerSheet({
    super.key,
    this.sheetConfig = const DatePickerSheetConfig(),
    this.rangeMode = false,
    this.initialDate,
    this.initialRange,
    this.fistDay,
    this.lastDay,
  });

  final DatePickerSheetConfig sheetConfig;

  // Is range mode
  final bool rangeMode;

  /// Single Select: Initial selected day
  final DateTime? initialDate;

  /// Multiple Select: Initial selected range
  final List<DateTime>? initialRange;

  /// First day of available date
  final DateTime? fistDay;

  /// Last day of available date
  final DateTime? lastDay;

  static Future<List<DateTime>?> showRange({
    required BuildContext context,
    required DatePickerSheetConfig sheetConfig,
    List<DateTime>? initialRange,
    DateTime? firstDay,
    DateTime? lastDay,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: FunDsColors.colorWhite,
      barrierColor: FunDsColors.colorNeutral900.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return FunDsDatePickerSheet(
          key: const Key('date_picker_sheet'),
          sheetConfig: sheetConfig,
          rangeMode: true,
          initialRange: initialRange,
          fistDay: firstDay,
          lastDay: lastDay,
        );
      },
    );
  }

  static Future<DateTime?> showSingle({
    required BuildContext context,
    required DatePickerSheetConfig sheetConfig,
    DateTime? initialDate,
    DateTime? firstDay,
    DateTime? lastDay,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: FunDsColors.colorWhite,
      barrierColor: FunDsColors.colorNeutral900.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return FunDsDatePickerSheet(
          key: const Key('date_picker_sheet'),
          sheetConfig: sheetConfig,
          rangeMode: false,
          initialDate: initialDate,
          fistDay: firstDay,
          lastDay: lastDay,
        );
      },
    );
  }

  @override
  State<FunDsDatePickerSheet> createState() => _FunDsDatePickerSheetState();
}

class _FunDsDatePickerSheetState extends State<FunDsDatePickerSheet> {
  DateTime? selectedDate;
  List<DateTime>? selectedRange;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    selectedRange = widget.initialRange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: FunDsColors.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 0.85.sh,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: Container(
                  width: 30.w,
                  height: 4.h,
                  decoration: ShapeDecoration(
                    color: FunDsColors.colorNeutral200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1160.r),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: FunDsIcon(
                      funDsIconography: FunDsIconography.actionIcCrossNude,
                      size: 24.w,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, top: 8.h, right: 12.w),
                    child: Text(
                      widget.sheetConfig.title,
                      style: FunDsTypography.heading20
                          .copyWith(color: FunDsColors.colorNeutral900),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            DatePickerCalendar(
              rangeMode: widget.rangeMode,
              initialDay: widget.initialDate,
              initialRangeStart: widget.initialRange?.first,
              initialRangeEnd: widget.initialRange?.last,
              firstDay: widget.fistDay,
              lastDay: widget.lastDay,
              onSingleChanged: (date) {
                selectedDate = date;
              },
              onRangeChanged: (start, end) {
                selectedRange = [start, end];
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: FunDsGroupButton(
                variant: FunDsGroupButtonVariant.horizontal,
                listButton: [
                  FunDsButton(
                    key: const Key('close_button'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    enabled: true,
                    type: FunDsButtonType.medium,
                    variant: FunDsButtonVariant.secondary,
                    text: widget.sheetConfig.closeButtonText,
                  ),
                  FunDsButton(
                    key: const Key('confirm_button'),
                    onPressed: () {
                      if (widget.rangeMode) {
                        Navigator.pop(context, selectedRange);
                      } else {
                        Navigator.pop(context, selectedDate);
                      }
                    },
                    enabled: true,
                    type: FunDsButtonType.medium,
                    variant: FunDsButtonVariant.primary,
                    text: widget.sheetConfig.confirmButtonText,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
