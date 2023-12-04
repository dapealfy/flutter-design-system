import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/widget/button/FunDsButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsGroupButton extends StatelessWidget {
  final GroupButtonVariant variant;
  final List<FunDsButton> listButton;
  final Widget? childCombo;

  const FunDsGroupButton(
      {Key? key,
      this.variant = GroupButtonVariant.vertical,
      required this.listButton,
      this.childCombo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case GroupButtonVariant.vertical:
        return ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return listButton[index];
          },
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: listButton.length,
        );
      case GroupButtonVariant.horizontal:
        return SizedBox(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 12.h,
            mainAxisSpacing: 12.h,
            children: List.generate(
              listButton.length,
              (index) {
                return listButton[index];
              },
            ),
          ),
        );
      case GroupButtonVariant.combo:
        return Row(
          children: [
            Flexible(
              flex: 1,
              child: childCombo != null ? childCombo! : const SizedBox(width: double.infinity),
            ),
            SizedBox(width: 12.w),
            Flexible(
                child:
                    listButton.isNotEmpty ? listButton.first : const SizedBox(width: double.infinity))
          ],
        );
    }
  }
}

enum GroupButtonVariant { vertical, horizontal, combo }
