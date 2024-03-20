import 'dart:math';

import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _defaultLength = 3;
const _icons = [
  FunDsIconography.actionIcSetting,
  FunDsIconography.actionIcCrossCircle,
  FunDsIconography.actionIcQrCode1,
];

class SwitcherCatalog extends StatefulWidget {
  const SwitcherCatalog({super.key});

  @override
  State<SwitcherCatalog> createState() => _SwitcherCatalogState();
}

class _SwitcherCatalogState extends State<SwitcherCatalog>
    with TickerProviderStateMixin {
  bool _showIcon = true;

  late TabController controller;
  late TabController smallController;
  late List<FunDsSwitcherTab> tabs;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: _defaultLength, vsync: this);
    smallController = TabController(length: 2, vsync: this);

    tabs = List.generate(_defaultLength, (index) {
      String icon = _icons[Random().nextInt(_icons.length)];
      return FunDsSwitcherTab(icon: icon, text: 'Tab $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Switcher',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FunDsButton(
              type: FunDsButtonType.small,
              variant: FunDsButtonVariant.primary,
              text: 'Enable Icon : $_showIcon',
              onPressed: () {
                setState(() {
                  _showIcon = !_showIcon;
                  tabs = List.generate(_defaultLength, (index) {
                    String icon = _icons[Random().nextInt(_icons.length)];
                    return FunDsSwitcherTab(
                        icon: _showIcon ? icon : null, text: 'Tab $index');
                  });
                });
              },
            ),
            const SizedBox(height: 24),
            FunDsSwitcher(
              tabs: tabs,
              controller: controller,
            ),
            SizedBox(
              height: 50,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: tabs.sublist(0).map((FunDsSwitcherTab tab) {
                  return Center(
                    child: Text(tab.text, style: const TextStyle(fontSize: 24)),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            FunDsSwitcher(
              tabs: tabs.sublist(1),
              controller: smallController,
            ),
            SizedBox(
              height: 50,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: smallController,
                children: tabs.sublist(0).map((FunDsSwitcherTab tab) {
                  return Center(
                    child: Text(tab.text, style: const TextStyle(fontSize: 24)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
