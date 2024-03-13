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
        ..._buildListLabel('Small Label', FunDsLabelSize.small, context),
        ..._buildListLabel('Medium Label', FunDsLabelSize.medium, context),
        ..._buildListLabel('Large Label', FunDsLabelSize.large, context),
      ],
    );
  }

  _buildListLabel(
    String title,
    FunDsLabelSize size,
    BuildContext context,
  ) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 24.0),
        child: Text(
          title,
          style: FunDsTypography.heading24,
        ),
      ),
      ...List.from(FunDsLabelColor.values).map((color) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  type: FunDsLabelType.invert,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.invert,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.invert,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  type: FunDsLabelType.outline,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.outline,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.outline,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  type: FunDsLabelType.filled,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.filled,
                ),
                _buildLabel(
                  context,
                  size: size,
                  color: color,
                  prefixIcon: FunDsIconography.actionIcCrossNude,
                  suffixIcon: FunDsIconography.actionIcCrossNude,
                  type: FunDsLabelType.filled,
                ),
              ]),
            ],
          ),
        );
      })
    ];
  }

  _buildLabel(
    BuildContext context, {
    String? prefixIcon,
    String? suffixIcon,
    required FunDsLabelSize size,
    required FunDsLabelColor color,
    required FunDsLabelType type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: FunDsLabel(
        'Label',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
