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
  late TabController controller;

  late List<SwitcherTab> tabs;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: _defaultLength, vsync: this);

    tabs = List.generate(_defaultLength, (index) {
      String icon = _icons[Random().nextInt(_icons.length)];
      return SwitcherTab(icon: icon, text: 'Tab $index');
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
            Switcher(
              tabs: tabs,
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
