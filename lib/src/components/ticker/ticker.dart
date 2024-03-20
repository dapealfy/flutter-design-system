import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TickerOutlineType {
  outline,
  nonOutline;
}

enum TickerVariant {
  info(
    backgroundColor: FunDsColors.colorBlue50,
    foregroundColor: FunDsColors.colorBlue600,
    icon: FunDsIconography.infoIcInformation,
  ),
  success(
    backgroundColor: FunDsColors.colorGreen50,
    foregroundColor: FunDsColors.colorGreen600,
    icon: FunDsIconography.actionIcCheckCircle,
  ),
  warning(
    backgroundColor: FunDsColors.colorOrange50,
    foregroundColor: FunDsColors.colorOrange600,
    icon: FunDsIconography.infoIcWarning,
  ),
  danger(
    backgroundColor: FunDsColors.colorRed50,
    foregroundColor: FunDsColors.colorRed500,
    icon: FunDsIconography.actionIcTrashCan,
  );

  final Color backgroundColor;
  final Color foregroundColor;
  final String icon;

  const TickerVariant({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });
}

/// Ticker
///
/// Usage :
/// ```dart
/// Ticker(
///   title: 'Optional title for Ticker',
///   description: 'a brief description here',
///   variant: TickerVariant.info,
///   outlineType: TickerOutlineType.outline,
///   textLink: 'Custom Text Link',
///   onCloseTap: () {
///     // do something
///   },
///   onTextLinkTap: () {
///     // do something
///   },
/// );
///
/// or
///
/// Ticker.span(
///   title: 'Optional title for Ticker',
///   description: TextSpan(text: 'a brief description here'),
///   variant: TickerVariant.info,
///   outlineType: TickerOutlineType.outline,
///   onCloseTap: () {
///     // do something
///   },
/// );
/// ```
class FunDsTicker extends StatelessWidget {
  FunDsTicker({
    super.key,
    this.title,
    required String description,
    required this.variant,
    required this.outlineType,
    this.icon,
    String? textLink,
    this.onTextLinkTap,
    this.onCloseTap,
  })  : description = TextSpan(text: description + ' '),
        textLink = (textLink != null)
            ? TextSpan(
                text: textLink,
                style: FunDsTypography.body12B.copyWith(
                  color: FunDsColors.colorPrimary500,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTextLinkTap,
              )
            : null;

  const FunDsTicker.span({
    super.key,
    this.title,
    required this.description,
    required this.variant,
    required this.outlineType,
    this.icon,
    this.onCloseTap,
  })  : textLink = null,
        onTextLinkTap = null;

  final TickerOutlineType outlineType;
  final TickerVariant variant;
  final String? icon;
  final String? title;
  final TextSpan description;
  final TextSpan? textLink;
  final VoidCallback? onTextLinkTap;
  final VoidCallback? onCloseTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = switch (outlineType) {
      TickerOutlineType.nonOutline => variant.backgroundColor,
      TickerOutlineType.outline => variant.foregroundColor,
    };

    final isLabelPresent = title != null && title!.isNotEmpty;

    final fontColor =
        isLabelPresent ? FunDsColors.colorTextDefault : variant.foregroundColor;

    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: variant.backgroundColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: const EdgeInsets.all(12),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildIcon(),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(
                      fontColor: fontColor,
                      visible: isLabelPresent,
                    ),
                    _buildDescription(fontColor: fontColor),
                  ],
                ),
              ),
              _buildCloseIcon(visible: isLabelPresent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return FunDsIcon(
      funDsIconography: icon ?? variant.icon,
      size: 24.w,
      color: variant.foregroundColor,
    );
  }

  Widget _buildTitle({required Color fontColor, required bool visible}) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          title ?? '',
          style: FunDsTypography.heading14.copyWith(color: fontColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildDescription({required Color fontColor}) {
    final content = [description];
    if(textLink != null) {
      content.add(textLink!);
    }

    return RichText(
      text: TextSpan(
        style: FunDsTypography.body12.copyWith(
          color: fontColor,
          height: 1.4,
        ),
        children: content,
      ),
    );
  }

  Widget _buildCloseIcon({required bool visible}) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Align(
          alignment: Alignment.topCenter,
          child: InkResponse(
            key: const Key('icon-close'),
            highlightShape: BoxShape.circle,
            containedInkWell: false,
            onTap: onCloseTap,
            child: FunDsIcon(
              funDsIconography: FunDsIconography.actionIcCrossNude,
              size: 16.w,
              color: FunDsColors.colorNeutral900,
            ),
          ),
        ),
      ),
    );
  }
}
