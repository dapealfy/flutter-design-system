import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsHeader extends StatelessWidget {
  final bool useDarkBg;
  final bool automaticallyImplyBack;
  final Function? onClickBack;
  final String title;
  final String? link;
  final Function? onClickLink;
  final FunDsIcon? rightIcon1;
  final Function? onClickRightIcon1;
  final FunDsIcon? rightIcon2;
  final Function? onClickRightIcon2;

  const FunDsHeader({
    super.key,
    this.useDarkBg = false,
    this.automaticallyImplyBack = true,
    this.onClickBack,
    required this.title,
    this.link,
    this.onClickLink,
    this.rightIcon1,
    this.onClickRightIcon1,
    this.rightIcon2,
    this.onClickRightIcon2,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      key: key,
      color: useDarkBg ? FunDsColors.colorNeutral900 : FunDsColors.colorWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: automaticallyImplyBack == true,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: FunDsIcon(
                          funDsIconography: FunDsIconography.basicIcArrowLeft,
                          size: 24.w,
                        ).copyWith(
                            color: useDarkBg
                                ? FunDsColors.colorWhite
                                : FunDsColors.colorNeutral900),
                        onTap: () {
                          onClickBack?.call();
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: FunDsTypography.heading16.copyWith(
                        color: useDarkBg
                            ? FunDsColors.colorWhite
                            : FunDsColors.colorNeutral900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: link != null && link!.isNotEmpty,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      onClickLink?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        link ?? '',
                        style: FunDsTypography.heading14.copyWith(
                          fontSize: 12.sp,
                          color: useDarkBg
                              ? FunDsColors.colorWhite
                              : FunDsColors.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: rightIcon2 != null,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: rightIcon2?.copyWith(
                        size: 24,
                        color: useDarkBg
                            ? FunDsColors.colorWhite
                            : FunDsColors.colorNeutral900,
                      ),
                      onTap: () {
                        onClickRightIcon2?.call();
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: rightIcon1 != null,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: rightIcon1?.copyWith(
                        size: 24,
                        color: useDarkBg
                            ? FunDsColors.colorWhite
                            : FunDsColors.colorNeutral900,
                      ),
                      onTap: () {
                        onClickRightIcon1?.call();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}