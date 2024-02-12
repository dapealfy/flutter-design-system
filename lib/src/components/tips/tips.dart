import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tips extends StatelessWidget {
  const Tips({
    super.key,
    required this.title,
    required this.description,
    this.onCloseTap,
    this.onContainerTap,
  });

  final String title;
  final String description;
  final VoidCallback? onCloseTap;
  final VoidCallback? onContainerTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onContainerTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: const BoxDecoration(
          color: FunDsColors.colorNeutral900,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    key: const Key('tipsTitle'),
                    style: FunDsTypography.heading14.copyWith(
                      color: FunDsColors.colorWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    key: const Key('tipsDescription'),
                    style: FunDsTypography.body12.copyWith(
                      color: FunDsColors.colorWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            InkWell(
              onTap: onCloseTap,
              key: const Key('tipsClose'),
              child: const FunDsIcon(
                funDsIconography: FunDsIconography.actionIcCrossNude,
                color: FunDsColors.colorWhite,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget tipsOverlay(
    BuildContext context, {
    required FunOverlayController controller,
    required String title,
    required String description,
    VoidCallback? onClose,
    required Widget child,
  }) {
    return FunOverlay(
      child: child,
      controller: controller,
      overlayWidth: MediaQuery.of(context).size.width,
      showArrow: true,
      arrowSize: Size(12.w, 6.h),
      arrowColor: FunDsColors.colorNeutral900,
      overlaySpace: 16.h,
      focusPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      focusRadius: 8.r,
      overlayWidget: Tips(
        title: title,
        description: description,
        onCloseTap: onClose ??
            () {
              controller.hide();
            },
      ),
    );
  }
}
