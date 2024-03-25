import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _alertDescription = "Alerts are visual elements used to communicate "
    "important information, warnings, or notifications to users within a "
    "digital interface. They typically consist of concise text messages and "
    "may include icons or color variations to convey the nature "
    "or urgency of the alert.";

class AlertCatalog extends StatefulWidget {
  const AlertCatalog({super.key});

  @override
  State<AlertCatalog> createState() => _AlertCatalogState();
}

class _AlertCatalogState extends State<AlertCatalog> {
  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Alerts',
      description: _alertDescription,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Master Component', style: FunDsTypography.heading16),
          const SizedBox(height: 16),
          FunDsAlert(
            type: FunDsAlertType.neutral,
            title: 'Master Component ',
            description: 'Put short description here.',
            primaryActionText: 'Main',
            icon: FunDsIconography.actionIcSetting,
            secondaryActionText: 'Secondary',
            onPrimaryActionTap: () {
              _onTap('Main Clicked');
            },
            onSecondaryActionTap: () {
              _onTap('Secondary Clicked');
            },
            onCloseTap: () {
              _onTap('Close Clicked');
            },
          ),
          const SizedBox(height: 32),
          Text('Component Types', style: FunDsTypography.heading16),
          const SizedBox(height: 16),
          ...FunDsAlertType.values.expand((e) {
            return [
              FunDsAlert(
                type: e,
                title: 'Single Action Alert',
                description: 'Put short description here.',
                primaryActionText: 'Main',
                onCloseTap: () {
                  _onTap('Close Clicked');
                },
                onPrimaryActionTap: () {
                  _onTap('Main Clicked');
                },
              ),
              const SizedBox(height: 8),
              FunDsAlert(
                type: e,
                title: 'Double Action Alert',
                description: 'Put short description here.',
                primaryActionText: 'Main',
                secondaryActionText: 'Secondary',
                onPrimaryActionTap: () {
                  _onTap('Main Clicked');
                },
                onSecondaryActionTap: () {
                  _onTap('Secondary Clicked');
                },
                onCloseTap: () {
                  _onTap('Close Clicked');
                },
              ),
              const SizedBox(height: 24),
            ];
          }).toList(),
        ]),
      ),
    );
  }

  _onTap(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  }
}
