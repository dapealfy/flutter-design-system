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
                'Toggle with text',
                style: FunDsTypography.heading20,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'Active',
                subtitle: 'set active by default',
                type: ToggleType.medium,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'In active',
                subtitle: 'set inactive by default',
                isActive: false,
                type: ToggleType.small,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'Title only',
                isActive: false,
                type: ToggleType.small,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'disabled inactive action',
                isActive: false,
                type: ToggleType.small,
                isEnabled: false,
              ),
              const SizedBox(height: 16),
              const Toggle(
                title: 'disabled active action',
                isActive: true,
                type: ToggleType.small,
                isEnabled: false,
              ),
            ]),
            const SizedBox(height: 32),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Toggle only',
                style: FunDsTypography.heading20,
              ),
              const SizedBox(height: 16),
              const Toggle(type: ToggleType.medium),
              const SizedBox(height: 16),
              const Toggle(isActive: false, type: ToggleType.small),
              const SizedBox(height: 16),
            ])
          ],
        ),
      ),
    );
  }
}
