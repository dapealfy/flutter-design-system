import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsCustomBottomSheet extends StatelessWidget {
  final Widget child;

  const FunDsCustomBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  static void showBottomSheet({
    Key? key,
    required BuildContext context,
    required Widget child,
    double? barrierOpacity,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: FunDsColors.colorWhite,
      barrierColor:
          FunDsColors.colorNeutral900.withOpacity(barrierOpacity ?? 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      builder: (BuildContext context) {
        return FunDsCustomBottomSheet(
          key: key,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
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
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 12.w),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 20.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 20.w,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500.h),
                child: child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
