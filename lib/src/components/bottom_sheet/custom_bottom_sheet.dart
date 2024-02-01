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
    return Container(
      color: FunDsColors.colorWhite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCrossNude,
                    size: 20.w,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 500.h),
                  child: child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
