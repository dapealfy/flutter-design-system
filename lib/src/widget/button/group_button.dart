import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/src/widget/button/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsGroupButton extends StatelessWidget {
  final FunDsGroupButtonVariant variant;
  final List<FunDsButton> listButton;
  final Widget? childCombo;

  const FunDsGroupButton({
    Key? key,
    required this.variant,
    required this.listButton,
    this.childCombo,
  }) : super(key: key);

  double getAspectRation(){
    if(listButton.isNotEmpty){
      switch(listButton.first.type){
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
          children: listButton.map((value) {
            return Column(
              children: [
                SizedBox(width: double.infinity, child: value),
                SizedBox(height: 12.h)
              ],
            );
          }).toList(),
        );
      case FunDsGroupButtonVariant.horizontal:
        List<FunDsButton> list = [];
        list.addAll(listButton);
        Widget? lastList;
        if (listButton.length % 2 != 0) {
          lastList = listButton.last;
          list.removeLast();
        }
        return Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
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
              flex: 1,
              child: childCombo != null
                  ? SizedBox(width: double.infinity, child: childCombo!)
                  : const SizedBox(width: double.infinity),
            ),
            SizedBox(width: 12.w),
            Flexible(
              flex: 1,
              child: listButton.isNotEmpty
                  ? SizedBox(width: double.infinity, child: listButton.first)
                  : const SizedBox(width: double.infinity),
            )
          ],
        );
    }
  }
}

enum FunDsGroupButtonVariant { vertical, horizontal, combo }
