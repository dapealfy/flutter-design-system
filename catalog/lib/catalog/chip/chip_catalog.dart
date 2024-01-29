import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ChipCatalog extends StatefulWidget {

  const ChipCatalog({super.key});

  @override
  State<ChipCatalog> createState() => _ChipCatalogState();
}

class _ChipCatalogState extends State<ChipCatalog> {

  @override
  Widget build(BuildContext context) {
    final toogleKnob = context.knobs.boolean(
      label: 'Use Enable Helper',
      description: 'Enable/Disable helper by this knobs',
      initial: true,
    );

    final size = context.knobs.options<FunDsChipType>(
      label: 'FunDsChip Size',
      initial: FunDsChipType.large,
      options: [
        const Option(
          label: 'Small',
          value: FunDsChipType.small,
        ),
        const Option(
          label: 'Medium',
          value: FunDsChipType.medium,
        ),
        const Option(
          label: 'Large',
          value: FunDsChipType.large,
        ),
      ],
    );

    return CatalogPage(
      title: 'Chip',
      description: 'Widget name: FunDsChip',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FunDsChip(
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                onPress: (isActive){},
              ),
              const SizedBox(height: 20),
              FunDsChip(
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                onPress: (isActive){},
              ),
              const SizedBox(height: 20),
              FunDsChip(
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                onPress: (isActive){},
              ),
              const SizedBox(height: 20),
              FunDsChip(
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                onPress: (isActive){},
              ),
              const SizedBox(height: 20),
              FunDsChip(
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                label: Container(
                  color: Colors.red,
                  child: const Text('ini nanti label'),
                ),
                onPress: (isActive){},
              )
            ],
          ),
        ),
      ),
    );
  }
}
