import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FunDsAlertType { neutral, success, info, warning, danger }

/// Alert
/// https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=6142-131542&mode=design&t=upImYzjCQGJHTU5L-0
///
/// How to use :
///
/// ```dart
/// Alert(
///   type: AlertType.neutral,
///   title: 'Double Action Alert',
///   description: 'Put short description here.',
///   primaryActionText: 'Main',
///   secondaryActionText: 'Secondary',
/// );
/// ```
class FunDsAlert extends StatelessWidget {
  const FunDsAlert({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    required this.primaryActionText,
    required this.onCloseTap,
    this.icon,
    this.secondaryActionText,
    this.onPrimaryActionTap,
    this.onSecondaryActionTap,
  });

  final FunDsAlertType type;
  final String title;
  final String description;
  final String? icon;
  final VoidCallback onCloseTap;
  final String primaryActionText;
  final String? secondaryActionText;
  final VoidCallback? onPrimaryActionTap;
  final VoidCallback? onSecondaryActionTap;

  @override
  Widget build(BuildContext context) {
    final String defaultIcon = switch (type) {
      FunDsAlertType.neutral => '',
      FunDsAlertType.success => FunDsIconography.actionIcCheckCircle,
      FunDsAlertType.info => FunDsIconography.infoIcInformation,
      FunDsAlertType.warning => FunDsIconography.infoIcWarning,
      FunDsAlertType.danger => FunDsIconography.actionIcCrossNude,
    };

    final Color? backgroundColor = switch (type) {
      FunDsAlertType.neutral => FunDsColors.colorWhite,
      FunDsAlertType.success => FunDsColors.colorGreen50,
      FunDsAlertType.info => FunDsColors.colorBlue50,
      FunDsAlertType.warning => FunDsColors.colorOrange50,
      FunDsAlertType.danger => FunDsColors.colorRed50,
    };

    final Color? mainColor = switch (type) {
      FunDsAlertType.neutral => null,
      FunDsAlertType.success => FunDsColors.colorGreen500,
      FunDsAlertType.info => FunDsColors.colorBlue500,
      FunDsAlertType.warning => FunDsColors.colorOrange500,
      FunDsAlertType.danger => FunDsColors.colorRed500,
    };

    final descriptionColor = type == FunDsAlertType.neutral
        ? FunDsColors.colorNeutral600
        : FunDsColors.colorNeutral900;

    const shadow = [
      BoxShadow(
        color: Color(0x1F4F5E71),
        offset: Offset(
          0.0,
          0.0,
        ),
        blurRadius: 2.0,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Color(0x1C4F5E71),
        offset: Offset(
          0.0,
          2.0,
        ),
        blurRadius: 4.0,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Color(0x174F5E71),
        offset: Offset(
          0.0,
          8.0,
        ),
        blurRadius: 16.0,
        spreadRadius: 0.0,
      ),
    ];

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: backgroundColor ?? FunDsColors.colorWhite,
          border: Border.all(
              color: mainColor ?? FunDsColors.colorWhite,
              style: BorderStyle.solid,
              width: 1),
          boxShadow: shadow),
      child: Stack(
        children: [
          Positioned(
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: InkWell(
                  key: const Key('btn-cross-close'),
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () {
                    onCloseTap.call();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: FunDsIcon(
                      funDsIconography: FunDsIconography.actionIcCrossNude,
                      size: 16,
                      color: FunDsColors.colorNeutral900,
                    ),
                  ),
                ),
              ),
            ),
            right: 0,
            top: 0,
            bottom: secondaryActionText == null ? 0 : null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 40, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  child: Container(
                    height: 20,
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FunDsIcon(
                      funDsIconography: icon ?? defaultIcon,
                      size: 18.r,
                      color: mainColor,
                    ),
                  ),
                  visible: (icon ?? defaultIcon) != '',
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Text(title,
                          style: FunDsTypography.heading14.copyWith(
                              color: mainColor ?? FunDsColors.colorNeutral900)),
                      const SizedBox(height: 2),
                      Text(
                        description,
                        style: FunDsTypography.body12.copyWith(
                          color: descriptionColor,
                        ),
                      ),
                      ..._showMultipleActions()
                    ])),
                Visibility(
                  visible: secondaryActionText == null,
                  child: FunDsButton(
                    key: const Key('btn-primary'),
                    type: FunDsButtonType.small,
                    variant: FunDsButtonVariant.primary,
                    text: primaryActionText,
                    onPressed: () {
                      onPrimaryActionTap?.call();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _showMultipleActions() {
    if (secondaryActionText == null) {
      return [const SizedBox()];
    }

    return [
      const SizedBox(height: 12),
      Row(
        children: [
          FunDsButton(
            key: const Key('btn-primary'),
            type: FunDsButtonType.small,
            variant: FunDsButtonVariant.primary,
            text: primaryActionText,
            onPressed: () {
              onPrimaryActionTap?.call();
            },
          ),
          const SizedBox(width: 12),
          FunDsButton(
            key: const Key('btn-secondary'),
            type: FunDsButtonType.small,
            variant: FunDsButtonVariant.secondary,
            text: secondaryActionText ?? '',
            onPressed: () {
              onSecondaryActionTap?.call();
            },
          )
        ],
      )
    ];
  }
}
