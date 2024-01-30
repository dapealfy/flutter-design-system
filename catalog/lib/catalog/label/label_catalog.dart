import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _desc = "The \"Label\" component is a fundamental textual element in a "
    "design system used to provide identification and context o "
    "various user interface elements.";

class LabelCatalog extends StatelessWidget {
  const LabelCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Label',
      child: _buildLabelCatalog(context),
      description: _desc,
    );
  }

  _buildLabelCatalog(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._buildListLabel('Small Label', LabelSize.small, context),
        ..._buildListLabel('Medium Label', LabelSize.medium, context),
        ..._buildListLabel('Large Label', LabelSize.large, context),
      ],
    );
  }

  _buildListLabel(
    String title,
    LabelSize size, BuildContext context,
  ) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 24.0),
        child: Text(
          title,
          style: FunDsTypography.heading24,
        ),
      ),
      ...List.from(LabelColor.values).map((color) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                _buildLabel(context,
                  size: size,
                  color: color,
                  type: LabelType.invert,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.invert,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.invert,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildLabel(context,
                  size: size,
                  color: color,
                  type: LabelType.outline,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.outline,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.outline,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildLabel(context,
                  size: size,
                  color: color,
                  type: LabelType.filled,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.filled,
                ),
                _buildLabel(context,
                  size: size,
                  color: color,
                  startIcon: FunDsIconography.actionIcCrossNude,
                  type: LabelType.filled,
                ),
              ]),
            ],
          ),
        );
      })
    ];
  }

  _buildLabel(BuildContext context, {
    String? startIcon,
    String? endIcon,
    required LabelSize size,
    required LabelColor color,
    required LabelType type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Label(
        'Label',
        leadingIcon: startIcon,
        trailingIcon: endIcon,
        size: size,
        color: color,
        type: type,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("On tap clicked"),
            duration: Duration(milliseconds: 200),
          ));
        },
      ),
    );
  }
}
