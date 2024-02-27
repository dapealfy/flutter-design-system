import 'dart:math';

import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _description = 'Tabs typically consist of a set of clickable elements '
    '(often text or icons) that represent each section of content. When a tab is '
    'clicked, the corresponding content is displayed while the other sections are '
    'hidden. Tabs are often used in conjunction with a tab bar or tab panel to '
    'provide a visual indication of the currently active tab.';

const _icons = [
  FunDsIconography.actionIcSetting,
  FunDsIconography.actionIcQrCode1,
  FunDsIconography.actionIcSort
];

class TabCatalog extends StatefulWidget {
  const TabCatalog({super.key});

  @override
  State<TabCatalog> createState() => _TabCatalogState();
}

class _TabCatalogState extends State<TabCatalog> with TickerProviderStateMixin {
  late TabController controller;
  late TabController mediumController;
  late TabController longController;

  late List<FunDsTab> tabs;
  late List<FunDsTab> mediumTabs;
  late List<FunDsTab> longTabs;

  bool _showIcon = true;

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 0, length: 3, vsync: this);
    mediumController = TabController(initialIndex: 0, length: 4, vsync: this);

    tabs = List.generate(controller.length, (index) {
      return FunDsTab(text: 'tab ${index + 1}');
    });

    _generateTabs(_showIcon);
  }

  _generateTabs(bool isEnableIcon) {
    mediumTabs = List.generate(mediumController.length, (index) {
      final number = Random().nextInt(99);
      return FunDsTab(
        text: 'tab ${index + 1}',
        icon: isEnableIcon ? _icons[Random().nextInt(_icons.length)] : null,
        badgeNumber: number,
      );
    });

    longTabs = List.generate(6, (index) {
      final number = Random().nextInt(99);
      return FunDsTab(
        text: 'tab ${index + 1}',
        icon: isEnableIcon ? _icons[Random().nextInt(_icons.length)] : null,
        badgeNumber: number,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    mediumController.dispose();
    longController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Tabs',
      description: _description,
      child: Column(
        children: [
          FunDsButton(
            type: FunDsButtonType.small,
            variant: FunDsButtonVariant.primary,
            text: 'Enable Icon : $_showIcon',
            onPressed: () {
              setState(() {
                _showIcon = !_showIcon;
                _generateTabs(_showIcon);
              });
            },
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default Tabs',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FunDsTypography.heading16,
                ),
                FunDsTabBar(
                    isScrollable: false,
                    controller: controller,
                    applyDefaultPadding: false,
                    tabs: tabs),
              ],
            ),
          ),
          const SizedBox(height: 32),
          FunDsHeader(
            title: 'tabs with header and controller',
            useDarkBg: false,
            tabBar: FunDsTabBar(
              isScrollable: true,
              controller: mediumController,
              tabs: mediumTabs,
            ),
          ),
          const SizedBox(height: 32),
          DefaultTabController(
            initialIndex: 2,
            length: 6,
            child: FunDsHeader(
              title: 'tab bar with DefaultTabController',
              useDarkBg: false,
              tabBar: FunDsTabBar(isScrollable: true, tabs: longTabs,),
            ),
          ),
        ],
      ),
    );
  }
}
