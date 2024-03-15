import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/navbar/raised_center_shape.dart';
import 'package:collection/collection.dart';

/// Figma: https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=9877-59070&mode=design&t=0YHcayDXyXHnvklH-0
class FunDsNavBar extends StatelessWidget {
  const FunDsNavBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
    this.raisedCenter = false,
  });

  /// List of [FunDsNavItem] to be shown in the navbar
  final List<FunDsNavItem> items;

  /// Whether the center item should be raised
  final bool raisedCenter;

  /// Index of the current selected item
  final int currentIndex;

  /// Function to be called when an item is tapped
  final Function(int index) onTap;

  static const raisedCenterRadius = 14.0;
  static const itemSpacing = 2.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          raisedCenter ? const EdgeInsets.only(top: raisedCenterRadius) : null,
      decoration: ShapeDecoration(
        shape: raisedCenter
            ? const RaisedCenterShape(radius: raisedCenterRadius)
            : const RoundedRectangleBorder(),
        color: Colors.white,
        shadows: const [
          BoxShadow(
            color: Color(0xFFF0F1F3),
            blurRadius: 8,
            offset: Offset(0, -1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(builder: (context, constraints) {
        // Calculate size for each item
        // Each item has 4 spacing
        final itemSize = (constraints.maxWidth / items.length) - itemSpacing;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...items.mapIndexed((index, e) {
              final isCenter = raisedCenter && index == items.length ~/ 2;
              final selected = index == currentIndex;

              return Padding(
                padding: EdgeInsets.only(
                  top: isCenter ? 0 : 16,
                  bottom: 16,
                ),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      onTap(index);
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: itemSize,
                      padding:
                          const EdgeInsets.symmetric(horizontal: itemSpacing),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: isCenter ? 40 : 24,
                            height: isCenter ? 40 : 24,
                            child: selected ? e.activeIcon : e.icon,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            e.label,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: selected
                                ? FunDsTypography.body10.copyWith(
                                    color: FunDsColors.colorTextLink,
                                  )
                                : FunDsTypography.body10.copyWith(
                                    color: FunDsColors.colorTextCaption),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList()
          ],
        );
      }),
    );
  }
}

class FunDsNavItem {
  /// Icon shown when not selected
  final Widget icon;

  /// Icon shown when selected
  final Widget activeIcon;

  /// Label shown below icon
  final String label;

  FunDsNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
