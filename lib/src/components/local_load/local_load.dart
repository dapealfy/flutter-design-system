import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Figma: https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=5493-18514&mode=design&t=Bgm7bFXXO7U8SCgp-0
class FunDsLocalLoad extends StatelessWidget {
  const FunDsLocalLoad({
    super.key,
    this.titleText,
    this.descriptionText,
    this.illustration,
    this.refreshText,
    this.onRefreshTap,
  });

  final String? titleText;
  final String? descriptionText;
  final Widget? illustration;
  final String? refreshText;
  final VoidCallback? onRefreshTap;

  @override
  Widget build(BuildContext context) {
    const defaultTitle = 'Gagal Memuat Konten';
    const defaultDescription =
        'Terjadi kesalahan sistem, silakan muat ulang untuk mengakses konten.';
    const defaultRefreshText = 'Muat Ulang';

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: FunDsColors.colorWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: FunDsColors.colorNeutral200,
          width: 1.w,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3DA4ACB9),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFF9FAFB),
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x585C5F29),
                  offset: Offset(0, 16),
                  blurRadius: 40,
                  spreadRadius: -8,
                ),
                BoxShadow(
                  color: Color(0x10182808),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -2,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: illustration ??
                FunDsIcon(
                  funDsIconography: FunDsIconography.damagedMapFilled,
                  size: 24.w,
                ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  titleText?.isNotEmpty == true ? titleText! : defaultTitle,
                  key: const Key('titleText'),
                  style: FunDsTypography.heading14
                      .copyWith(color: FunDsColors.colorTextDefault),
                ),
                SizedBox(height: 4.h),

                // Description
                Text(
                  descriptionText?.isNotEmpty == true
                      ? descriptionText!
                      : defaultDescription,
                  key: const Key('descriptionText'),
                  style: FunDsTypography.body12.copyWith(
                    color: FunDsColors.colorTextCaption,
                  ),
                ),

                if (onRefreshTap != null) ...[
                  SizedBox(height: 12.h),
                  FunDsButton(
                    key: const Key('refreshButton'),
                    type: FunDsButtonType.xSmall,
                    variant: FunDsButtonVariant.secondary,
                    text: refreshText?.isNotEmpty == true
                        ? refreshText!
                        : defaultRefreshText,
                    leftIcon: FunDsIcon(
                      funDsIconography: FunDsIconography.actionIcRefresh,
                      size: 16.w,
                      color: FunDsColors.colorPrimary,
                    ),
                    onPressed: onRefreshTap,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
