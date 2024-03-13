import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressCircleCatalog extends StatelessWidget {
  const ProgressCircleCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final label =
        context.knobs.options<String?>(label: 'Label', initial: null, options: [
      const Option(
        label: 'null',
        value: null,
      ),
      const Option(label: 'Active User', value: 'Active User'),
    ]);

    final progress = context.knobs.slider(
      label: 'Progress',
      initial: 0,
      max: 100,
      min: 0,
    );

    final useAnimation = context.knobs.boolean(
      label: 'Use Animation',
      initial: true,
      description: 'Enable/Disable animation by this knobs',
    );

    return CatalogPage(
      title: 'Progress Circle',
      description: 'Progress Circle',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Progress Circle',
            style: FunDsTypography.heading24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size : ${FunDsProgressCircleSize.values[i].name}',
                      style: FunDsTypography.body14B,
                    ),
                    Center(
                      child: FunDsProgressCircle(
                        progress: progress,
                        size: FunDsProgressCircleSize.values[i],
                        label: label,
                        useAnimation: useAnimation,
                        variant: FunDsProgressCircleVariant.circle,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, i) => const Divider(),
              itemCount: FunDsProgressCircleSize.values.length,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Progress Circle Half',
            style: FunDsTypography.heading24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size : ${FunDsProgressCircleSize.values[i].name}',
                      style: FunDsTypography.body14B,
                    ),
                    Center(
                      child: FunDsProgressCircle(
                        progress: progress,
                        size: FunDsProgressCircleSize.values[i],
                        label: label,
                        useAnimation: useAnimation,
                        variant: FunDsProgressCircleVariant.half,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, i) => const Divider(),
              itemCount: FunDsProgressCircleSize.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
