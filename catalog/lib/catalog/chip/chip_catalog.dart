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
  var listChipValue = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final toogleKnob = context.knobs.boolean(
      label: 'Use Enable Helper',
      description: 'Enable/Disable helper by this knobs',
      initial: true,
    );

    final size = context.knobs.options<FunDsChipType>(
      label: 'FunDsChip Size',
      description: 'Change chipSize by this knobs',
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

    final labelType = context.knobs.options<LabelType>(
      label: 'Label Type',
      description: 'Change Label Type by this knobs',
      initial: LabelType.filled,
      options: [
        const Option(
          label: 'Filled',
          value: LabelType.filled,
        ),
        const Option(
          label: 'Invert',
          value: LabelType.invert,
        ),
        const Option(
          label: 'Outline',
          value: LabelType.outline,
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
                key: const Key('chip1'),
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                isActive: listChipValue[0],
                onPress: () {
                  setState(() {
                    listChipValue[0] = !listChipValue[0];
                  });
                },
              ),
              const SizedBox(height: 20),
              FunDsChip(
                key: const Key('chip2'),
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                isActive: listChipValue[1],
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                onPress: () {
                  setState(() {
                    listChipValue[1] = !listChipValue[1];
                  });
                },
              ),
              const SizedBox(height: 20),
              FunDsChip(
                key: const Key('chip3'),
                text: 'Chips Label',
                type: size,
                enable: toogleKnob,
                isActive: listChipValue[2],
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                onPress: () {
                  setState(() {
                    listChipValue[2] = !listChipValue[2];
                  });
                },
              ),
              const SizedBox(height: 20),
              FunDsChip(
                key: const Key('chip4'),
                text: 'Chips Label',
                type: size,
                isActive: listChipValue[3],
                enable: toogleKnob,
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                onPress: () {
                  setState(() {
                    listChipValue[3] = !listChipValue[3];
                  });
                },
              ),
              const SizedBox(height: 20),
              FunDsChip(
                key: const Key('chip5'),
                text: 'Chips Label',
                type: size,
                isActive: listChipValue[4],
                enable: toogleKnob,
                leading: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcSortFilter,
                  size: 20.r,
                ),
                trailing: FunDsIcon(
                  funDsIconography: FunDsIconography.basicIcChevronDown,
                  size: 20.r,
                ),
                label: Label(
                  'Label',
                  type: labelType,
                  color: LabelColor.red,
                ),
                onPress: () {
                  setState(() {
                    listChipValue[4] = !listChipValue[4];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
