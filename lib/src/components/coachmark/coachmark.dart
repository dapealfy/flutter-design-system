import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class FunDsCoachMark extends StatelessWidget {
  final String title;
  final String description;
  final String overflow;
  final String primaryButtonText;
  final String secondaryButtonText;
  final void Function()? onPressedPrimary;
  final void Function()? onPressedSecondary;

  const FunDsCoachMark({
    super.key,
    required this.title,
    required this.description,
    required this.overflow,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.onPressedPrimary,
    this.onPressedSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FunDsColors.colorWhite,
      surfaceTintColor: FunDsColors.colorWhite,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: FunDsTypography.heading16, maxLines: 2),
            const SizedBox(height: 8),
            Text(
              description,
              style: FunDsTypography.body14.copyWith(
                color: FunDsColors.colorNeutral600,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  overflow,
                  style: FunDsTypography.body14.copyWith(
                    color: FunDsColors.colorTextCaption,
                  ),
                  maxLines: 1,
                ),
                Row(
                  children: [
                    FunDsButton(
                      key: const Key('btn-secondary'),
                      type: FunDsButtonType.small,
                      variant: FunDsButtonVariant.secondary,
                      text: secondaryButtonText,
                      onPressed: onPressedSecondary,
                    ),
                    const SizedBox(width: 8),
                    FunDsButton(
                      key: const Key('btn-primary'),
                      type: FunDsButtonType.small,
                      variant: FunDsButtonVariant.primary,
                      text: primaryButtonText,
                      onPressed: onPressedPrimary,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget overlayTarget(
    BuildContext context, {
    required FunDsOverlayController controller,
    required String title,
    required String description,
    required String primaryButtonText,
    required String secondaryButtonText,
    required Widget child,
    VoidCallback? onClickPrimary,
    VoidCallback? onClickSecondary,
    String overflow = '',
  }) {
    return FunDsOverlay(
      controller: controller,
      showArrow: false,
      focusPadding: const EdgeInsets.all(8),
      focusRadius: 8,
      overlayWidth: MediaQuery.of(context).size.width - 36,
      overlayPosition: FunDsOverlayPosition.preferBottom,
      overlaySpace: 16,
      overlayWidget: FunDsCoachMark(
        title: title,
        description: description,
        overflow: overflow,
        primaryButtonText: primaryButtonText,
        onPressedPrimary: onClickPrimary ?? controller.hide,
        secondaryButtonText: secondaryButtonText,
        onPressedSecondary: onClickSecondary ?? controller.hide,
      ),
      child: child,
    );
  }
}
