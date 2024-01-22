import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LoaderCatalog extends StatefulWidget {
  const LoaderCatalog({super.key});

  @override
  State<LoaderCatalog> createState() => _LoaderCatalogState();
}

class _LoaderCatalogState extends State<LoaderCatalog> {

  @override
  Widget build(BuildContext context) {
    final position = context.knobs.options<FunDsLoaderPosition>(
      label: 'Loader Position',
      description: 'Pick one position for loader',
      initial: FunDsLoaderPosition.top,
      options: [
        const Option(label: 'Top', value: FunDsLoaderPosition.top),
        const Option(label: 'Bottom', value: FunDsLoaderPosition.bottom),
        const Option(label: 'Left', value: FunDsLoaderPosition.left),
        const Option(label: 'Right', value: FunDsLoaderPosition.right),
      ],
    );

    final variant = context.knobs.options<FunDsLoaderVariant>(
      label: 'Loader Variant',
      description: 'Pick one variant for loader',
      initial: FunDsLoaderVariant.spinner,
      options: [
        const Option(label: 'Spinner', value: FunDsLoaderVariant.spinner),
        const Option(label: 'Dot', value: FunDsLoaderVariant.dot),
      ],
    );

    final text = context.knobs.text(label: 'desc', initial: 'Ini desc wir');


    return CatalogPage(
      title: 'Loader',
      description: 'Widget name: FunDsLoader',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Lottie Spin Loader'),
            Center(
              child: FunDsLoader(
                height: 100.h,
                width: 100.w,
                desc: text,
                position: position,
                variant: variant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
