import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsBanner extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? leftIcon;
  final bool? showCloseButton;
  final Widget? button;
  final FunDsBannerType? type;
  final FunDsBannerVariant variant;
  final FunDsBannerVersion? version;
  final Widget? image;
  final Function()? onCloseIconPressed;
  const FunDsBanner({
    super.key,
    this.type,
    required this.variant,
    this.version,
    required this.title,
    this.description,
    this.showCloseButton,
    this.button,
    this.image,
    this.leftIcon,
    this.onCloseIconPressed,
  });

  factory FunDsBanner.general({
    required String title,
    String? description,
    Widget? leftIcon,
    bool showCloseButton = true,
    FunDsBannerVersion version = FunDsBannerVersion.v1,
    FunDsBannerType type = FunDsBannerType.normal,
    FunDsButton? button,
    Function()? onCloseIconPressed,
  }) {
    return FunDsBanner(
      type: type,
      variant: FunDsBannerVariant.general,
      version: version,
      title: title,
      description: description,
      showCloseButton: showCloseButton,
      button: button != null
          ? version == FunDsBannerVersion.v1
              ? TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: button.onPressed,
                  child: Text(
                    button.text,
                    style: const TextStyle(
                      color: FunDsColors.colorPrimary500,
                      decoration: TextDecoration.underline,
                    ),
                  ))
              : button
          : null,
      leftIcon: leftIcon,
    );
  }

  factory FunDsBanner.sticky({
    required String text,
    bool showCloseButton = true,
    FunDsBannerVersion version = FunDsBannerVersion.v1,
    FunDsButton? button,
    Function()? onCloseIconPressed,
  }) {
    return FunDsBanner(
      variant: FunDsBannerVariant.sticky,
      version: version,
      title: text,
      showCloseButton: showCloseButton,
      button: button,
    );
  }

  factory FunDsBanner.marketing({
    required String title,
    String? description,
    Widget? image,
    FunDsButton? button,
  }) {
    return FunDsBanner(
      variant: FunDsBannerVariant.marketing,
      description: description,
      title: title,
      button: button,
      image: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case FunDsBannerVariant.general:
        return _buildGeneralBanner();
      case FunDsBannerVariant.sticky:
        return _buildStickyBanner();
      case FunDsBannerVariant.marketing:
        return _buildMarketingBanner();
    }
  }

  Widget _buildGeneralBanner() {
    return Container(
      padding: EdgeInsets.all(
        16.r,
      ),
      decoration: BoxDecoration(
          color: type == FunDsBannerType.highlight
              ? FunDsColors.colorPrimary100
              : null,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: type == FunDsBannerType.highlight
                ? FunDsColors.colorPrimary500
                : FunDsColors.colorNeutral200,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: version == FunDsBannerVersion.v1
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (leftIcon != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: 12.w,
                  ),
                  child: SizedBox(
                    key: const Key('leftIcon'),
                    width: version == FunDsBannerVersion.v1 ? 20.w : 46.w,
                    child: leftIcon!,
                  ),
                ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            key: const Key('title'),
                            maxLines: 1,
                            style: FunDsTypography.body14B,
                          ),
                        ),
                        if (showCloseButton != null && showCloseButton!)
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.w,
                            ),
                            child: _closeButton(
                              FunDsColors.colorNeutral600,
                            ),
                          ),
                      ],
                    ),
                    if (description != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: 4.h,
                        ),
                        child: Text(
                          description!,
                          key: const Key('description'),
                          maxLines: 5,
                          style: FunDsTypography.body12.copyWith(
                            color: FunDsColors.colorNeutral600,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
          if (button != null)
            Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                left: leftIcon != null
                    ? version == FunDsBannerVersion.v1
                        ? 32.w
                        : 58.w
                    : 0,
              ),
              key: const Key('button'),
              child: button,
            )
        ],
      ),
    );
  }

  Widget _buildStickyBanner() {
    return Container(
      color: version == FunDsBannerVersion.v1
          ? FunDsColors.colorPrimary
          : FunDsColors.colorBlack,
      padding: EdgeInsets.symmetric(
        vertical: 8.r,
        horizontal: 12.r,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Text(
              title,
              key: const Key('title'),
              style: FunDsTypography.body12.copyWith(
                color: FunDsColors.colorWhite,
              ),
            ),
          ),
          Row(
            children: [
              if (button != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                  ),
                  key: const Key('button'),
                  child: button,
                ),
              if (showCloseButton != null && showCloseButton!)
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                  ),
                  child: _closeButton(
                    FunDsColors.colorWhite,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMarketingBanner() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: FunDsColors.colorNeutral200,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            key: const Key('image'),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: image,
            ),
          ),
          const Divider(
            height: 1,
            color: FunDsColors.colorNeutral200,
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  key: const Key('title'),
                  maxLines: 1,
                  style: FunDsTypography.body14B,
                ),
                if (description != null)
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.h,
                    ),
                    child: Text(
                      description!,
                      key: const Key('description'),
                      style: FunDsTypography.body12.copyWith(
                        color: FunDsColors.colorNeutral600,
                      ),
                    ),
                  ),
                if (button != null)
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12.h,
                    ),
                    key: const Key('button'),
                    child: button,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _closeButton(Color iconColor) {
    return GestureDetector(
      key: const Key('closeButton'),
      onTap: onCloseIconPressed,
      child: FunDsIcon(
        funDsIconography: FunDsIconography.actionIcCrossNude,
        size: 16.w,
        color: iconColor,
      ),
    );
  }
}

enum FunDsBannerType { normal, highlight }

enum FunDsBannerVariant { general, sticky, marketing }

enum FunDsBannerVersion { v1, v2 }
