import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsDivider extends StatelessWidget {
  const FunDsDivider({super.key});

  static Widget lineWithLabel({
    Key? key,
    required String text,
    String? labelPrefixIcon,
    String? labelSuffixIcon,
    VoidCallback? onTapLabel,
  }) {
    return Row(
      key: key,
      children: [
        Label(
          // label cant handle multiple line
          text.substring(0, text.length < 50 ? text.length : 50),
          prefixIcon: labelPrefixIcon,
          suffixIcon: labelSuffixIcon,
          size: LabelSize.small,
          type: LabelType.outline,
          color: LabelColor.white,
          onTap: onTapLabel,
        ),
        const Flexible(
          child: FunDsDivider(),
        ),
      ],
    );
  }

  static Widget solidText({Key? key, required String text}) {
    return Container(
        key: key,
        width: double.infinity,
        color: FunDsColors.colorNeutral50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            text,
            textDirection: TextDirection.ltr,
            style: FunDsTypography.body12.copyWith(
              color: FunDsColors.colorNeutral500,
            ),
          ),
        ));
  }

  static Widget textAndLine({Key? key, required String text}) {
    return Row(
      key: key,
      children: [
        const Flexible(child: FunDsDivider()),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          constraints: BoxConstraints(maxWidth: 200.w),
          child: Text(
            text,
            style: FunDsTypography.body10
                .copyWith(color: FunDsColors.colorNeutral500),
          ),
        ),
        const Flexible(child: FunDsDivider()),
      ],
    );
  }

  static Widget thickLine({Key? key}) {
    return Divider(
      key: key,
      thickness: 8.h,
      color: FunDsColors.colorNeutral50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Divider(
      key: key,
      color: FunDsColors.colorNeutral200,
    );
  }
}
