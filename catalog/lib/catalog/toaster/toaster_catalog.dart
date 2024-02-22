import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ToasterCatalog extends StatelessWidget {
  const ToasterCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final leftIcon = context.knobs.options<Widget?>(
      label: 'Left Icon',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        const Option(
          label: 'Icon',
          value: FunDsIcon(
            funDsIconography: FunDsIconography.infoIcWarning,
            size: 18,
            color: FunDsColors.colorWhite,
          ),
        ),
      ],
    );

    return CatalogPage(
      title: 'Toaster',
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final toaster = Toaster(
                context: context,
                message: 'Put short description here!',
                label: 'Action',
                onAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ACTION CLICKED'),
                    ),
                  );
                },
                leftIcon: leftIcon,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a Toaster.
              ScaffoldMessenger.of(context).showSnackBar(toaster);
            },
            child: const Text('Show Toaster Normal'),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              final toaster = Toaster(
                context: context,
                type: ToasterType.error,
                message: 'Put short description here!',
                label: 'Action',
                onAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ACTION CLICKED'),
                    ),
                  );
                },
                leftIcon: leftIcon,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a Toaster.
              ScaffoldMessenger.of(context).showSnackBar(toaster);
            },
            child: const Text('Show Toaster Error'),
          ),
        ],
      ),
    );
  }
}
