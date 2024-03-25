import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsHeaderCalendar extends StatelessWidget {
  const FunDsHeaderCalendar({
    super.key,
    required this.headerTitle,
    this.onTapDoubleLeft,
    this.onTapLeft,
    this.onTapDoubleRight,
    this.onTapRight,
    this.onTapTitle,
  });

  final String headerTitle;
  final VoidCallback? onTapDoubleLeft;
  final VoidCallback? onTapLeft;
  final VoidCallback? onTapDoubleRight;
  final VoidCallback? onTapRight;
  final VoidCallback? onTapTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: onTapDoubleLeft != null,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => onTapDoubleLeft?.call(),
                      child: const FunDsIcon(
                        funDsIconography:
                            FunDsIconography.basicDoubleIcChevronLeft,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible:onTapLeft != null ,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => onTapLeft?.call(),
                    child: const FunDsIcon(
                      funDsIconography: FunDsIconography.basicIcChevronLeft,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: InkWell(
            onTap: () => onTapTitle?.call(),
            child: Text(
              textAlign: TextAlign.center,
              headerTitle,
              style: FunDsTypography.heading14,
            ),
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Visibility(
                  visible:onTapRight != null ,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: ()=> onTapRight?.call(),
                      child: const FunDsIcon(
                        funDsIconography: FunDsIconography.basicIcChevronRight,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              Visibility(
                visible:onTapDoubleRight != null ,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () =>onTapDoubleRight?.call(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: const FunDsIcon(
                        funDsIconography: FunDsIconography.basicDoubleIcChevronRight,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
