import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FunDsProgressIndicatorCatalog extends StatelessWidget {
  const FunDsProgressIndicatorCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final useDescription = context.knobs.boolean(
      label: 'Use Description',
      initial: true,
    );

    List<FunDsProgressIndicatorData> exampleContext = [
      FunDsProgressIndicatorData(
        label: 'Label 1',
        description: useDescription ? 'Label 1 Desc' : null,
        state: FunDsProgressIndicatorState.complete,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 2',
        description: useDescription ? 'Label 2 Desc' : null,
        state: FunDsProgressIndicatorState.active,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 3',
        description: useDescription ? 'Label 3 Desc' : null,
        state: FunDsProgressIndicatorState.incomplete,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 4',
        description: useDescription ? 'Label 4 Desc' : null,
        state: FunDsProgressIndicatorState.error,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 5',
        description: useDescription ? 'Label 5 Desc' : null,
        state: FunDsProgressIndicatorState.incomplete,
      ),
    ];
    return CatalogPage(
      title: 'FunDsProgressIndicator',
      description: 'FunDsProgressIndicator\nType : Horizontal and Vertical',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type : Horizontal',
            style: FunDsTypography.heading20,
          ),
          SizedBox(
            height: 8.h,
          ),
          FunDsProgressIndicator(
            data: exampleContext,
            type: FunDsProgressIndicatorType.horizontal,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Type : Vertical',
            style: FunDsTypography.heading20,
          ),
          SizedBox(
            height: 8.h,
          ),
          FunDsProgressIndicator(
            data: exampleContext,
            type: FunDsProgressIndicatorType.vertical,
          ),
        ],
      ),
    );
  }
}
