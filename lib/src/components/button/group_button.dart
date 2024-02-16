import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/src/components/button/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsGroupButton extends StatelessWidget {
  final FunDsGroupButtonVariant variant;
  final List<FunDsButton>? listButton;
  final FunDsButton? funDsButton;
  final Widget? childCombo;
  final int? childComboFlex;
  final int? funDsButtonFlex;

  const FunDsGroupButton({
    Key? key,
    required this.variant,
    this.listButton,
    this.funDsButton,
    this.childCombo,
    this.childComboFlex = 1,
    this.funDsButtonFlex = 1,
  })  : assert(
          (childCombo == null && funDsButton == null) ||
              (childCombo != null &&
                  funDsButton != null &&
                  variant == FunDsGroupButtonVariant.combo),
          'childCombo and funDsButton must be used together in combo variant',
        ),
        assert(
          (funDsButton == null || listButton == null),
          'funDsButton and listButton cannot be used together',
        ),
        super(key: key);

  factory FunDsGroupButton.combo({
    Key? key,
    required FunDsButton funDsButton,
    required Widget childCombo,
    int? childComboFlex,
    int? funDsButtonFlex,
  }) {
    return FunDsGroupButton(
      key: key,
      variant: FunDsGroupButtonVariant.combo,
      funDsButton: funDsButton,
      childCombo: childCombo,
      childComboFlex: childComboFlex,
      funDsButtonFlex: funDsButtonFlex,
    );
  }

  double getAspectRation() {
    if (listButton?.isNotEmpty == true) {
      switch (listButton?.first.type) {
        case FunDsButtonType.xLarge:
          return 2.8;
        case FunDsButtonType.large:
          return 3;
        case FunDsButtonType.medium:
          return 4;
        case FunDsButtonType.small:
          return 5;
        case FunDsButtonType.xSmall:
          return 5.5;
        default:
          return 4;
      }
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case FunDsGroupButtonVariant.vertical:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: listButton?.map((value) {
                return Column(
                  children: [
                    SizedBox(width: double.infinity, child: value),
                    SizedBox(height: 12.h)
                  ],
                );
              }).toList() ??
              [],
        );
      case FunDsGroupButtonVariant.horizontal:
        List<FunDsButton> list = [];
        list.addAll(listButton ?? []);
        Widget? lastList;
        if (listButton?.length != null && listButton!.length % 2 != 0) {
          lastList = listButton?.last;
          list.removeLast();
        }
        return Column(
          key: key,
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              padding: EdgeInsets.zero,
              childAspectRatio: getAspectRation(),
              children: list,
            ),
            Visibility(
              visible: (lastList != null),
              child: Column(children: [
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  child: (lastList != null)
                      ? lastList
                      : const SizedBox(
                          width: double.infinity,
                        ),
                )
              ]),
            )
          ],
        );
      case FunDsGroupButtonVariant.combo:
        return Row(
          children: [
            Flexible(
              flex: childComboFlex ?? 1,
              child: childCombo != null
                  ? SizedBox(width: double.infinity, child: childCombo!)
                  : const SizedBox(width: double.infinity),
            ),
            SizedBox(width: 12.w),
            Flexible(
              flex: funDsButtonFlex ?? 1,
              child: SizedBox(width: double.infinity, child: funDsButton),
            ),
          ],
        );
    }
  }
}

enum FunDsGroupButtonVariant { vertical, horizontal, combo }
