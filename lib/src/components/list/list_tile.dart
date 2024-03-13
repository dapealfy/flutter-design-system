import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_design_system/src/colors/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsListTile<T> extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? subtitle;
  final String? alertText;
  final Widget? trailing;
  final funds.FunDsBadge? badge;
  final funds.FunDsLabel? label;
  final void Function()? onTap;
  const FunDsListTile({
    super.key,
    this.leading,
    this.trailing,
    this.subtitle,
    this.alertText,
    this.label,
    required this.title,
    this.badge,
    this.onTap,
  });

  factory FunDsListTile.chevron({
    Widget? leading,
    required String title,
    String? subtitle,
    String? alertText,
    Widget? trailing,
    funds.FunDsBadge? badge,
    funds.FunDsLabel? label,
    void Function()? onTap,
  }) {
    return FunDsListTile(
      title: title,
      subtitle: subtitle,
      alertText: alertText,
      label: label,
      badge: badge,
      leading: leading,
      onTap: onTap,
      trailing: const Icon(
        key: Key('trailing_chevron'),
        Icons.arrow_forward_ios_rounded,
        color: FunDsColors.colorNeutral600,
        size: 20,
      ),
    );
  }

  factory FunDsListTile.checkbox({
    Widget? leading,
    required String title,
    String? subtitle,
    String? alertText,
    funds.FunDsBadge? badge,
    funds.FunDsLabel? label,
    required bool value,
    void Function()? onTap,
    required Function(bool?) onCheckedChanged,
  }) {
    return FunDsListTile(
      title: title,
      subtitle: subtitle,
      alertText: alertText,
      label: label,
      badge: badge,
      leading: leading,
      onTap: onTap,
      trailing: funds.FunDsCheckbox(
        key: const Key('trailing_checkbox'),
        variant: funds.FunDsCheckboxVariant.primary,
        onChanged: onCheckedChanged,
        defaultValue: value,
      ),
    );
  }

  factory FunDsListTile.radio({
    Widget? leading,
    required String title,
    String? subtitle,
    String? alertText,
    funds.FunDsBadge? badge,
    funds.FunDsLabel? label,
    void Function()? onTap,
    required T value,
    required T selectedValue,
    required Function(T?) onRadioChanged,
  }) {
    return FunDsListTile(
      title: title,
      subtitle: subtitle,
      alertText: alertText,
      label: label,
      badge: badge,
      leading: leading,
      onTap: onTap,
      trailing: funds.FunDsRadioButton<T>(
        key: const Key('trailing_radio'),
        selectedValue: selectedValue,
        onChanged: onRadioChanged,
        value: value,
      ),
    );
  }

  factory FunDsListTile.label({
    Widget? leading,
    required String title,
    String? subtitle,
    String? alertText,
    funds.FunDsBadge? badge,
    funds.FunDsLabel? subTitlelabel,
    required funds.FunDsLabel label,
    void Function()? onTap,
  }) {
    return FunDsListTile(
      title: title,
      subtitle: subtitle,
      alertText: alertText,
      label: subTitlelabel,
      badge: badge,
      leading: leading,
      trailing: funds.FunDsLabel(
        label.text,
        color: label.color,
        onTap: label.onTap,
        key: const Key('trailing_label'),
        prefixIcon: label.prefixIcon,
        suffixIcon: label.suffixIcon,
        size: label.size,
        type: label.type,
      ),
      onTap: onTap,
    );
  }

  factory FunDsListTile.button({
    Widget? leading,
    required String title,
    String? subtitle,
    String? alertText,
    funds.FunDsBadge? badge,
    funds.FunDsLabel? label,
    required funds.FunDsButton button,
    void Function()? onTap,
  }) {
    return FunDsListTile(
      title: title,
      subtitle: subtitle,
      alertText: alertText,
      label: label,
      badge: badge,
      leading: leading,
      trailing: funds.FunDsButton(
        text: button.text,
        type: button.type,
        variant: button.variant,
        enabled: button.enabled,
        key: const Key(
          'trailing_button',
        ),
        onPressed: button.onPressed,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          title: Row(
            children: [
              Text(
                title,
                key: const Key('title'),
                style: funds.FunDsTypography.body16B,
              ),
              if (badge != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.0.w,
                  ),
                  key: const Key('badge'),
                  child: badge!,
                ),
            ],
          ),
          subtitle: (subtitle != null || label != null || alertText != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            key: const Key('subtitle'),
                            style: funds.FunDsTypography.body14.copyWith(
                              color: FunDsColors.colorNeutral600,
                            ),
                          ),
                        if (label != null)
                          Padding(
                            padding: EdgeInsets.only(
                              left: subtitle != null ? 12.w : 0,
                            ),
                            key: const Key('subtitleLabel'),
                            child: label,
                          ),
                      ],
                    ),
                    if (alertText != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                        ),
                        child: Text(
                          '$alertText',
                          key: const Key('alert'),
                          style: funds.FunDsTypography.body12.copyWith(
                            color: FunDsColors.colorRed500,
                          ),
                        ),
                      ),
                  ],
                )
              : null,
          trailing: trailing,
          leading: leading,
        ),
        SizedBox(
          height: 16.h,
        ),
        Divider(
          height: 1.h,
          color: FunDsColors.colorNeutral200,
        ),
      ],
    );
  }
}
