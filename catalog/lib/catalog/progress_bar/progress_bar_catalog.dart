import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressBarCatalog extends StatelessWidget {
  const ProgressBarCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.knobs.options<FunDsProgressBarSize>(
      label: 'Size',
      initial: FunDsProgressBarSize.small,
      options: [
        const Option(label: 'Small', value: FunDsProgressBarSize.small),
        const Option(label: 'Medium', value: FunDsProgressBarSize.medium),
        const Option(label: 'Large', value: FunDsProgressBarSize.large),
      ],
    );

    final color = context.knobs.options<FunDsProgressBarColor>(
      label: 'Color',
      initial: FunDsProgressBarColor.grey,
      options: [
        const Option(label: 'Grey', value: FunDsProgressBarColor.grey),
        const Option(label: 'Purple', value: FunDsProgressBarColor.purple),
        const Option(label: 'Green', value: FunDsProgressBarColor.green),
        const Option(label: 'Yellow', value: FunDsProgressBarColor.yellow),
        const Option(label: 'Orange', value: FunDsProgressBarColor.orange),
        const Option(label: 'Red', value: FunDsProgressBarColor.red),
      ],
    );

    final value = context.knobs.slider(
      label: 'Progress Value',
      initial: 50,
      min: 0,
      max: 100,
    );

    return CatalogPage(
      title: 'ProgressBar',
      description: 'ProgressBar has 2 variants, 3 Sizes and 6 Colors.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ProgressBar'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FunDsProgressBar(
              key: const Key('progressbar'),
              size: size,
              color: color,
              value: value,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            color: FunDsColors.colorNeutral200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ProgressBar Alternate'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FunDsProgressBar.alternate(
                    key: const Key('progressbar_alternate'),
                    size: size,
                    color: color,
                    value: value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
