import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';

const _toggleDescription = 'Toggle: A toggle is a binary switch that '
    'allows users to turn a setting or feature on or off. '
    'It typically consists of a button that can be toggled '
    'between two states: active and inactive.';

class ToggleCatalog extends StatefulWidget {
  const ToggleCatalog({super.key});

  @override
  State<ToggleCatalog> createState() => _ToggleCatalogState();
}

class _ToggleCatalogState extends State<ToggleCatalog> {
  bool _toggleValueActive = true;
  bool _toggleValueInActive = false;

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Toggle',
      description: _toggleDescription,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Toggle only',
                style: FunDsTypography.heading20,
              ),
              const SizedBox(height: 16),
              Text(
                'Type : Medium',
                style: FunDsTypography.body12,
              ),
              const Row(children: [
                Toggle(type: ToggleType.medium),
                Toggle(
                  type: ToggleType.medium,
                  isActive: false,
                ),
              ]),
              const SizedBox(height: 16),
              Text(
                'Type : Small',
                style: FunDsTypography.body12,
              ),
              const Row(children: [
                Toggle(type: ToggleType.small),
                Toggle(
                    type: ToggleType.small, isActive: false),
              ]),
              const SizedBox(height: 16),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Toggle with text',
                style: FunDsTypography.heading20,
              ),
              const SizedBox(height: 16),
              Toggle(
                title: 'Active Default',
                subtitle: 'Value $_toggleValueActive',
                isActive: _toggleValueActive,
                type: ToggleType.medium,
                onChanged: (bool isActive) {
                  setState(() {
                    _toggleValueActive = isActive;
                  });
                },
              ),
              const SizedBox(height: 16),
              Toggle(
                title: 'In active Default',
                subtitle: 'Value $_toggleValueInActive',
                isActive: false,
                type: ToggleType.medium,
                onChanged: (bool isActive) {
                  setState(() {
                    _toggleValueInActive = isActive;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'Title only',
                isActive: false,
                type: ToggleType.medium,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'Disabled',
                isActive: false,
                type: ToggleType.medium,
                isEnabled: false,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'Disabled',
                isActive: true,
                type: ToggleType.medium,
                isEnabled: false,
              ),
            ]),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
