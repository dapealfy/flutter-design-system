import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:showcaseview/showcaseview.dart';

class CoachMark extends StatelessWidget {
  final String title;
  final String description;
  final String overflow;
  final String primaryButtonText;
  final String secondaryButtonText;
  final void Function()? onPressedPrimary;
  final void Function()? onPressedSecondary;

  const CoachMark({
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

  /// Overlay parent, which will host all overlay entries.
  static Widget overlayBuilder({
    required Widget Function(BuildContext) builder,
  }) {
    return ShowCaseWidget(
      builder: Builder(builder: builder),
      enableAutoScroll: true,
      disableBarrierInteraction: true,
      onComplete: (activeWidgetId, targetKey) {
        Scrollable.ensureVisible(
          targetKey.currentContext!,
          duration: const Duration(milliseconds: 300),
          alignment: 0.5,
        );
      },
    );
  }

  /// [child] is the widget to be highlighted
  /// [overlayEntry] is the coachmark
  static Widget overlayTarget({
    required BuildContext context,
    required GlobalKey<State> key,
    required Widget child,
    required Widget overlayEntry,
  }) {
    return Showcase.withWidget(
      key: key,
      height: 0,
      width: MediaQuery.of(context).size.width,
      tooltipPosition: TooltipPosition.bottom,
      targetPadding: const EdgeInsets.all(8),
      overlayColor: FunDsColors.colorOverlay,
      disableMovingAnimation: true,
      overlayOpacity: 0.8,
      container: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: overlayEntry,
        ),
      ),
      child: child,
    );
  }

  /// Begin the showcase
  static void start(BuildContext context, List<GlobalKey<State>> keys) {
    ShowCaseWidget.of(context).startShowCase(keys);
  }

  /// Move to next id showcase
  static void next(BuildContext context) {
    ShowCaseWidget.of(context).next();
  }

  /// End the showcase
  static void dismiss(BuildContext context) {
    ShowCaseWidget.of(context).dismiss();
  }
}
